<#
.SYNOPSIS
    Validates README.md against this repository's editorial rules.

.DESCRIPTION
    Checks entry format, alphabetical ordering, duplicate names and domains, the pricing and
    platform label vocabularies, and that every Contents link points at a real heading.

    Optionally checks that external links resolve.

    This script is a convenience. The list does not depend on it, and nothing here needs to
    run for the repository to be correct. It has no dependencies beyond PowerShell 5.1.

.PARAMETER Path
    Path to README.md. Defaults to the README next to this script's parent directory.

.PARAMETER CheckLinks
    Also request every external URL. Slow, and rate-limited on purpose.

.EXAMPLE
    pwsh ./scripts/qa-check.ps1

.EXAMPLE
    pwsh ./scripts/qa-check.ps1 -CheckLinks
#>

[CmdletBinding()]
param(
    [string]$Path,
    [switch]$CheckLinks
)

$ErrorActionPreference = 'Stop'

if (-not $Path) {
    $Path = Join-Path (Split-Path -Parent $PSScriptRoot) 'README.md'
}
if (-not (Test-Path $Path)) {
    Write-Error "README not found at $Path"
    exit 2
}

$PricingLabels  = @('Free', 'Freemium', 'Paid', 'Open Source', 'Free Trial')
$PlatformLabels = @('Web', 'Windows', 'macOS', 'Linux', 'iOS', 'Android', 'API', 'CLI',
                    'Browser Extension', 'VS Code', 'JetBrains', 'Discord')

$problems = New-Object System.Collections.ArrayList
$warnings = New-Object System.Collections.ArrayList
function Add-Problem($m) { [void]$problems.Add($m) }
function Add-Warning($m) { [void]$warnings.Add($m) }

$lines = Get-Content -LiteralPath $Path -Encoding UTF8


# ---------------------------------------------------------------- parse

$entries    = New-Object System.Collections.ArrayList
$headings   = New-Object System.Collections.ArrayList
$contents   = New-Object System.Collections.ArrayList
$category   = $null

for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    $no   = $i + 1

    if ($line -match '^##\s+(.+?)\s*$') {
        $headings.Add($Matches[1]) | Out-Null
        $category   = $Matches[1]
        continue
    }

    # A contents bullet is the only list item that links to an in-page anchor,
    # so it needs no section gating and works in any language.
    if ($line -match '^\s*-\s+\[(.+?)\]\(#(.+?)\)') {
        $contents.Add([pscustomobject]@{ Text = $Matches[1]; Anchor = $Matches[2]; Line = $no }) | Out-Null
        continue
    }

    if ($line -match '^-\s+\*\*\[') {
        if ($line -notmatch '^-\s+\*\*\[(?<name>[^\]]+)\]\((?<url>[^)]+)\)\*\*\s+\u2014\s+(?<rest>.+)$') {
            Add-Problem "L${no}: entry does not match the required format"
            continue
        }
        $name = $Matches['name']; $url = $Matches['url']; $rest = $Matches['rest']

        # Optional trailing TiorAI deep link, separated by a middot:
        #   ... `Web` <middot> [alternatives](https://tiorai.com/alternatives/foo/)
        $deep = ''
        if ($rest -match '^(?<body>.*?)\s+\u00b7\s+\[(?<dtext>[^\]]+)\]\((?<durl>[^)]+)\)\s*$') {
            $deep = $Matches['durl']
            $rest = $Matches['body']
        }

        $labels = [regex]::Matches($rest, '`([^`]+)`') | ForEach-Object { $_.Groups[1].Value }
        $desc   = ($rest -replace '`[^`]+`', '').Trim()

        $entries.Add([pscustomobject]@{
            Name = $name; Url = $url; Category = $category
            Description = $desc; Labels = @($labels); DeepLink = $deep; Line = $no
        }) | Out-Null
    }
}

Write-Host ""
Write-Host "awesome-ai-tools QA" -ForegroundColor Cyan
Write-Host ("=" * 60)
Write-Host ("Entries:    {0}" -f $entries.Count)
$categories = @($entries | Select-Object -ExpandProperty Category -Unique)
Write-Host ("Categories: {0}" -f $categories.Count)
Write-Host ""

# ---------------------------------------------------------------- contents

foreach ($c in $contents) {
    $slug = ($headings | ForEach-Object {
        ($_.ToLower() -replace '[^\p{L}\p{Nd} -]', '') -replace ' ', '-'
    })
    if ($slug -notcontains $c.Anchor) {
        Add-Problem ("L{0}: Contents link '#{1}' has no matching heading" -f $c.Line, $c.Anchor)
    }
}
foreach ($cat in $categories) {
    $anchor = ($cat.ToLower() -replace '[^\p{L}\p{Nd} -]', '') -replace ' ', '-'
    if (-not ($contents | Where-Object { $_.Anchor -eq $anchor })) {
        Add-Problem "Category '$cat' is missing from the Contents block"
    }
}

# ---------------------------------------------------------------- ordering

foreach ($cat in $categories) {
    $inCat = @($entries | Where-Object { $_.Category -eq $cat })
    $names = @($inCat | ForEach-Object { $_.Name })
    $sorted = @($names | Sort-Object -Culture 'en-US')
    for ($i = 0; $i -lt $names.Count; $i++) {
        if ($names[$i] -ne $sorted[$i]) {
            Add-Problem ("'{0}' is out of alphabetical order in '{1}' (expected '{2}')" -f $names[$i], $cat, $sorted[$i])
            break
        }
    }
    if ($inCat.Count -lt 4) {
        Add-Problem ("Category '{0}' has only {1} entries; the minimum is 4" -f $cat, $inCat.Count)
    } elseif ($inCat.Count -lt 8) {
        Add-Warning ("Category '{0}' has {1} entries; 8 is the working target" -f $cat, $inCat.Count)
    }
}

# ---------------------------------------------------------------- duplicates

$byName = $entries | Group-Object { ($_.Name -replace '[^a-zA-Z0-9]', '').ToLower() } |
          Where-Object { $_.Count -gt 1 }
foreach ($g in $byName) {
    Add-Problem ("Duplicate tool name: {0}" -f (($g.Group | ForEach-Object { $_.Name }) -join ', '))
}

function Get-RegistrableDomain($url) {
    if ($url -notmatch '^https?://([^/:?#]+)') { return $null }
    $host_ = $Matches[1].ToLower() -replace '^www\.', ''
    $parts = $host_.Split('.')
    if ($parts.Count -le 2) { return $host_ }
    $twoLevel = @('co.uk','com.au','co.jp','com.br','co.in','org.uk','ac.uk','com.cn')
    $last2 = ($parts[-2..-1] -join '.')
    if ($twoLevel -contains $last2) { return ($parts[-3..-1] -join '.') }
    return $last2
}

$byHost = $entries | Group-Object { if ($_.Url -match '^https?://([^/:?#]+)') { $Matches[1].ToLower() -replace '^www\.','' } } |
          Where-Object { $_.Count -gt 1 }
foreach ($g in $byHost) {
    Add-Problem ("Duplicate host '{0}': {1}" -f $g.Name, (($g.Group | ForEach-Object { $_.Name }) -join ', '))
}

$byDomain = $entries | Group-Object { Get-RegistrableDomain $_.Url } | Where-Object { $_.Count -gt 1 }
foreach ($g in $byDomain) {
    $hosts = @($g.Group | ForEach-Object { if ($_.Url -match '^https?://([^/:?#]+)') { $Matches[1].ToLower() } } | Select-Object -Unique)
    if ($hosts.Count -eq 1) { continue }  # already reported as a duplicate host
    Add-Warning ("Shared domain '{0}' across distinct products - confirm these are separate: {1}" -f $g.Name, (($g.Group | ForEach-Object { $_.Name }) -join ', '))
}

# ---------------------------------------------------------------- entry rules

foreach ($e in $entries) {
    if ($e.Url -notmatch '^https://') {
        Add-Problem ("L{0}: {1} - URL is not HTTPS" -f $e.Line, $e.Name)
    }
    if ($e.Url -match '[?&](utm_|fpr=|fp_ref=|afmc=|aff|ref=|coupon=|via=)') {
        Add-Problem ("L{0}: {1} - URL carries tracking or affiliate parameters" -f $e.Line, $e.Name)
    }

    $pricing  = @($e.Labels | Where-Object { $PricingLabels  -contains $_ })
    $platform = @($e.Labels | Where-Object { $PlatformLabels -contains $_ })
    $unknown  = @($e.Labels | Where-Object { $PricingLabels -notcontains $_ -and $PlatformLabels -notcontains $_ })

    if ($unknown.Count) {
        Add-Problem ("L{0}: {1} - label(s) outside the vocabulary: {2}" -f $e.Line, $e.Name, ($unknown -join ', '))
    }
    if ($pricing.Count -eq 0) {
        Add-Problem ("L{0}: {1} - no pricing label" -f $e.Line, $e.Name)
    }
    if ($pricing.Count -gt 2) {
        Add-Problem ("L{0}: {1} - {2} pricing labels; the maximum is 2" -f $e.Line, $e.Name, $pricing.Count)
    }

    $words = @(($e.Description -split '\s+') | Where-Object { $_ -ne '' })
    if ($words.Count -gt 35) {
        Add-Problem ("L{0}: {1} - description is {2} words; the maximum is 35" -f $e.Line, $e.Name, $words.Count)
    } elseif ($words.Count -lt 8) {
        Add-Warning ("L{0}: {1} - description is {2} words; 8 is the target minimum" -f $e.Line, $e.Name, $words.Count)
    }
    if ($e.Description -notmatch '\.$') {
        Add-Warning ("L{0}: {1} - description does not end with a full stop" -f $e.Line, $e.Name)
    }

    foreach ($word in @('best','leading','revolutionary','cutting-edge','game-changing','powerful','ultimate','seamless','unleash','world-class')) {
        if ($e.Description -match "\b$word\b") {
            Add-Warning ("L{0}: {1} - marketing word '{2}' in description" -f $e.Line, $e.Name, $word)
        }
    }
}

# ---------------------------------------------------------------- tiorai deep links

$deep = @($entries | Where-Object { $_.DeepLink })
$cap  = [math]::Floor($entries.Count * 0.15)
Write-Host ("TiorAI deep links: {0} of {1} entries, cap {2}" -f $deep.Count, $entries.Count, $cap)
Write-Host ""

if ($deep.Count -gt $cap) {
    Add-Problem ("{0} entries carry a TiorAI deep link; the cap is 15 percent ({1})" -f $deep.Count, $cap)
}
foreach ($e in $deep) {
    if ($e.DeepLink -notmatch '^https://tiorai\.com/(alternatives|compare)/[a-z0-9-]+/$') {
        Add-Problem ("L{0}: {1} - trailing link must be a canonical tiorai.com /alternatives/ or /compare/ URL" -f $e.Line, $e.Name)
    }
}
foreach ($g in ($deep | Group-Object DeepLink | Where-Object { $_.Count -gt 1 })) {
    Add-Problem ("The same TiorAI deep link is reused on {0} entries: {1}" -f $g.Count, $g.Name)
}
foreach ($g in ($deep | Group-Object Category | Where-Object { $_.Count -gt 3 })) {
    Add-Warning ("Category '{0}' has {1} deep links; keep it to 3 or fewer" -f $g.Name, $g.Count)
}

# ---------------------------------------------------------------- repeated phrasing

$openings = $entries | Group-Object { (($_.Description -split '\s+') | Select-Object -First 2) -join ' ' } |
            Where-Object { $_.Count -ge 4 }
foreach ($g in $openings) {
    Add-Warning ("{0} descriptions open with '{1}'; vary the phrasing" -f $g.Count, $g.Name)
}

$aiPowered = @($entries | Where-Object { $_.Description -match 'AI-powered' })
if ($aiPowered.Count -gt 2) {
    Add-Warning ("'AI-powered' appears in {0} descriptions" -f $aiPowered.Count)
}

# ---------------------------------------------------------------- relative links

$body = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
$root = Split-Path -Parent $Path
foreach ($m in [regex]::Matches($body, '\]\((?!https?://|#|\.\./\.\./)([^)]+)\)')) {
    $rel = $m.Groups[1].Value
    if (-not (Test-Path (Join-Path $root $rel))) {
        Add-Problem "Relative link '$rel' does not resolve to a file"
    }
}

# ---------------------------------------------------------------- secrets

foreach ($pat in @('DB_PASSWORD','DB_USER','wp-config','localhost/','127\.0\.0\.1','[A-Za-z]:\\wamp','sk-[A-Za-z0-9]{20}','wp_[A-Za-z0-9]{0,12}_?posts')) {
    if ($body -match $pat) {
        Add-Problem "README contains a forbidden pattern: $pat"
    }
}

# ---------------------------------------------------------------- links

if ($CheckLinks) {
    Write-Host "Checking external links (slow, rate limited)..." -ForegroundColor Yellow
    $ua = 'Mozilla/5.0 (compatible; awesome-ai-tools link check)'
    $urls = @($entries | ForEach-Object { $_.Url })
    $urls += @([regex]::Matches($body, '\]\((https://[^)]+)\)') | ForEach-Object { $_.Groups[1].Value })
    foreach ($u in ($urls | Select-Object -Unique)) {
        try {
            $r = Invoke-WebRequest -Uri $u -Method Head -TimeoutSec 20 -UserAgent $ua -ErrorAction Stop
            if ([int]$r.StatusCode -ge 400) { Add-Problem "HTTP $($r.StatusCode): $u" }
        } catch {
            $code = $null
            if ($_.Exception.Response) { try { $code = [int]$_.Exception.Response.StatusCode } catch {} }
            if ($code -in 403, 405, 429, 999) {
                Add-Warning "HTTP $code (likely bot protection, verify by hand): $u"
            } else {
                Add-Problem "Unreachable$(if($code){" (HTTP $code)"}): $u"
            }
        }
        Start-Sleep -Milliseconds 400
    }
}

# ---------------------------------------------------------------- report

if ($warnings.Count) {
    Write-Host "Warnings ($($warnings.Count)):" -ForegroundColor Yellow
    $warnings | ForEach-Object { Write-Host "  ! $_" -ForegroundColor Yellow }
    Write-Host ""
}

if ($problems.Count) {
    Write-Host "Problems ($($problems.Count)):" -ForegroundColor Red
    $problems | ForEach-Object { Write-Host "  x $_" -ForegroundColor Red }
    Write-Host ""
    Write-Host "FAIL" -ForegroundColor Red
    exit 1
}

Write-Host "PASS" -ForegroundColor Green
Write-Host ("{0} entries, {1} categories, no problems found." -f $entries.Count, $categories.Count)
exit 0
