# QA report (Phase 8)

Date of QA run: **2026-08-18**
Verdict: **PASS**

Content, structure, links, templates, and safety checks all pass with zero unresolved
defects. The content licence, which was the one outstanding owner decision when this report
was first written, has been made: **CC BY 4.0**, committed as `LICENSE`.

## Summary

| Metric | Result |
|---|---|
| Tools listed | 120 |
| Categories | 14 |
| Entries per category | 8–10 |
| Clickable external links | 146 unique |
| Confirmed reachable | 146 |
| Broken links remaining | 0 |
| Duplicate tools | 0 |
| Markdown problems | 0 |
| YAML problems | 0 |
| Secrets or credentials found | 0 |
| Private data found | 0 |
| TiorAI links per README | 34 (16 structural, 18 per-entry) |

## Content checks

| Check | Result |
|---|---|
| Tool names match the vendor's own spelling | Pass, 120/120 |
| Official URL present and canonical | Pass, 120/120 |
| Descriptions original, not vendor copy | Pass, 120/120 rewritten from scratch |
| Description length within 8–35 words | Pass; range 8–16, mean 11.8, median 12 |
| One primary category per tool | Pass, no cross-listing |
| Pricing label present | Pass, 120/120 |
| Pricing vocabulary respected | Pass; only `Free`, `Freemium`, `Paid`, `Open Source`, `Free Trial` |
| Maximum two pricing labels | Pass |
| Platform vocabulary respected | Pass; no labels outside the allowed twelve |
| Alphabetical ordering within category | Pass, all 14 categories |
| Every category has at least 4 entries | Pass; minimum is 8 |
| Duplicate names | None |
| Duplicate hosts | None |
| Affiliate or tracking parameters on tool links | None |
| Non-HTTPS links | None |

## Content issues found and fixed

Editorial issues caught during verification, all resolved before this report:

| Issue | Resolution |
|---|---|
| **Sora** was on the shortlist as a live OpenAI video product | **Discontinued.** App closed 26 April 2026; API closes 24 September 2026. Removed. Replaced with Kling |
| **Windsurf / Codeium** shortlisted as an independent editor | Acquired by Cognition; both domains now redirect to `devin.ai/desktop`. Relisted as **Devin** |
| **NotebookLM** shortlisted under that name | Renamed **Gemini Notebook** on 16 July 2026. Relisted under the current name and URL |
| **Podcastle** shortlisted for audio | `podcastle.ai` now redirects to `async.com`, a repositioned video product. Removed; replaced with Murf |
| **MonkeyLearn** in the candidate pool | Shut down. Removed at shortlist stage |
| **Midjourney** provisionally labelled `Freemium` | No free tier since 2023. Corrected to `Paid` |
| **n8n** provisionally labelled `Open Source` | Source-available under a sustainable-use licence, not OSI open source. Label removed; description says "source-available" |
| Nine URLs pointed at non-canonical addresses | Corrected: Runway (`runwayml.com` → `runway.com`), Relume (`.io` → `.ai`), Durable (`.co` → `.com`), Sudowrite, Captions, Obviously AI (dropped `www.`), Luma, Kling, Devin |
| `Scite` sorted before `SciSpace`; `D-ID` before `Descript` | Both re-sorted. `CONTRIBUTING.md` now states that punctuation is ignored when alphabetising |
| Pinecone description was 7 words | Extended to 10 |
| `Figma`, `Obsidian`, `Zotero`, `Snyk`, `Sourcegraph` shortlisted | Removed: AI is a feature, not the product's purpose |

## Markdown checks

| Check | Result |
|---|---|
| Heading hierarchy (single H1, H2 sections) | Pass |
| Contents links resolve to real headings | Pass, 20/20 |
| Every category appears in Contents | Pass, 14/14 |
| Entry format consistent | Pass, 120/120 match the format regex |
| Relative repository links resolve to files | Pass |
| Badge images load | Pass, 3/3 (shields.io) |
| Tables render | Pass |
| Code blocks closed | Pass |
| No raw HTML | Pass |

Rendering was verified by parsing rather than by eye: `scripts/qa-check.ps1` reads
`README.md` with the same structural assumptions GitHub does and fails on any entry that does
not match.

## Link validation

**146 unique clickable links** across `README.md`, `CONTRIBUTING.md`, `SECURITY.md`,
`CODE_OF_CONDUCT.md`, `CHANGELOG.md`, `docs/`, and the issue forms.
162 URL-shaped strings were extracted in total; the extra 16 are not links and were excluded
from the pass/fail count:

- `https://www.chat.openai.com` and `https://www.claude.ai` — quoted inside code spans in
  the portfolio data audit as examples of **wrong** URLs held in the source catalogue.
  The first does not resolve, which is precisely the finding being documented.
- `https://tiorai.com/tool-category/{slug}/` and similar — URL *patterns* with placeholders.
- Reference-style link fragments inside the Code of Conduct that the extractor split
  incorrectly.

Method: `GET` with a browser user agent, redirects followed to a depth of 8, 12-second connect
timeout, 30-second total, 250 ms between requests. Bounded and deliberately slow — no host was
hit hard.

| Outcome | Count |
|---|---|
| `2xx` on the first pass | 133 |
| Confirmed live by a second route | 13 |
| **Confirmed broken** | **0** |

### The 13 that needed a second route

A `403` from a bot-protection layer is not evidence a site is dead. Each was confirmed live
by requesting a non-challenged path on the same host, and by reaching the vendor's own
documentation or help centre:

| URL | First pass | How it was confirmed |
|---|---|---|
| `chatgpt.com` | 403 | Host responds; verified in a browser context |
| `claude.ai` | 403 → `/login` | Redirect to the product's own login is proof of life |
| `www.perplexity.ai` | 403 | `robots.txt` 200 |
| `poe.com` | 403 → `/login` | `robots.txt` 200 |
| `quillbot.com` | 403 | `help.quillbot.com` 200 |
| `ideogram.ai` | 403 | `robots.txt` 200 |
| `leonardo.ai` | 403 | `robots.txt` 200 |
| `looka.com` | 403 | `robots.txt` 200 |
| `www.make.com` | 403 → `/en` | `robots.txt` 200; locale redirect only |
| `gamma.app` | 403 | `help.gamma.app` 200 |
| `www.midjourney.com` | TLS handshake failure | A local TLS limitation on the checking machine, not a server fault. Confirmed live independently, including current pricing |
| `devin.ai` | 429 | Rate-limited by our own repeated requests. `docs.devin.ai` 200 |
| `www.contributor-covenant.org` | Connection timeout | Network path from the build machine. Site confirmed live independently; the Code of Conduct text was fetched successfully from the project's own repository |

Two others resolved on their own between passes and needed nothing further:
`www.canva.com` (403 on an early run, `2xx` on the final one) and `scispace.com`
(`202`, a Cloudflare interstitial that still serves the page).

### Redirects reviewed

All redirects were followed and inspected rather than accepted. Nine entries were rewritten to
their canonical destination (listed above). The redirects left in place are benign:

- `www.deepl.com` → `www.deepl.com/en` — locale selection.
- `www.make.com` → `www.make.com/en` — locale selection.
- `claude.ai` → `claude.ai/login`, `poe.com` → `poe.com/login` — auth walls on the product's
  own domain. Correct destination for a logged-out visitor.
- `lumalabs.ai` → `lumalabs.ai/app` — product landing.

No redirect chain leaves the vendor's own registrable domain. No shorteners, no interstitials,
no tracking hops.

## Duplicate validation

Checked four ways, as required:

| Method | Result |
|---|---|
| Normalised tool name (lowercased, punctuation stripped) | 120 distinct, 0 collisions |
| Full host, `www.` stripped | 120 distinct, 0 collisions |
| Registrable domain | 119 distinct; **1 shared domain reviewed** |
| Spelling variants and renames | Handled at selection; see below |

**The one shared domain:** `adobe.com` covers **Adobe Firefly** (`firefly.adobe.com`, image
generation) and **Adobe Podcast** (`podcast.adobe.com`, audio repair). Two separate products,
two different categories, two different jobs. Reviewed and kept. The validator reports this as
a warning rather than an error, so it stays visible for future review.

Rename and variant handling: the source catalogue holds many near-duplicate records for one
product (`Suno AI`, `Suno AI Music`, `Suno AI Music Generator`, `Suno Music Downloader`,
`Suno-list`, `suno-top`; fifteen `Flux` variants). Selection worked from canonical product
identity rather than from catalogue records, so one product produced exactly one entry.
Normalisation covered `www.`, trailing slashes, tracking parameters, capitalisation, and
renamed products.

## YAML validation

All three files parsed with a YAML parser and checked against GitHub's issue-form schema.

| File | Result |
|---|---|
| `.github/ISSUE_TEMPLATE/suggest-a-tool.yml` | Pass — parses; `name`, `description`, `body` present; `name` longer than 3 characters; 11 body elements; all non-markdown elements have unique `id`s; 4 dropdowns with valid options; 4 required checkboxes; all `validations.required` are booleans |
| `.github/ISSUE_TEMPLATE/report-a-broken-link.yml` | Pass — same checks; 6 body elements |
| `.github/ISSUE_TEMPLATE/config.yml` | Pass — `blank_issues_enabled: false`; 2 contact links, each with `name`, `url`, `about`, both pointing at verified TiorAI pages |

File locations match GitHub's requirements: forms in `.github/ISSUE_TEMPLATE/` with a `.yml`
extension, `pull_request_template.md` in `.github/`.

## Secret and privacy scan

Scanned every shipped file for credentials, infrastructure detail, and personal data.

| Pattern | Found |
|---|---|
| API keys, tokens, `sk-` prefixed strings | None |
| Passwords, `DB_PASSWORD`, `DB_USER`, `DB_NAME` | None |
| Database table prefix | None |
| WordPress salts, `AUTH_KEY`, `NONCE_SALT` | None |
| `wp-config` contents | None |
| `.env` files or contents | None |
| Internal or private IP addresses | None |
| Development-server addresses | None |
| Local absolute filesystem paths | None |
| Production admin URLs | None |
| Customer, user, or account data | None |
| Personal email addresses | None |

Two items were found during the scan and removed before this report: a reference to the
development server's local address, and the build machine's configured Git author email. Both
were in the portfolio environment audit.

The only pattern matches remaining are inside `scripts/qa-check.ps1`, which lists these
strings as **patterns it searches for**. That is the scanner, not a finding.

## Repository cleanliness

| Check | Result |
|---|---|
| Temporary files | None |
| Editor backup files | None |
| Unrelated files | None |
| Debug output | None |
| Test dumps or data exports | None |
| Working files from the build | None — kept outside the repository throughout |

## TiorAI link review

34 links across a 120-entry README: 16 structural and 18 per-entry.

| Placement | Count | URL |
|---|---|---|
| Introduction | 1 | `tiorai.com/` |
| Category expansion | 11 | 11 distinct `tiorai.com/tool-category/…` archives |
| About section | 4 | `tiorai.com/`, `/tools/`, `/compare/`, `/alternatives/` |
| Per-entry deep links | 18 | 9 `/alternatives/…`, 9 `/compare/…`, all distinct |

The 18 per-entry links sit at exactly the 15% ceiling the owner set and are placed by search
intent rather than uniformly: a tool people look for substitutes for gets its `/alternatives/`
page, a tool that sits in a well-known two-horse race gets that specific head-to-head. Fourteen
of the eighteen comparison targets pair two tools that are both on this list. No category
carries more than three, no URL is reused, and 102 of 120 entries carry no TiorAI link at all.

`scripts/qa-check.ps1` enforces the ceiling, the URL shape, and the no-reuse rule, so the
model cannot drift upward without failing the build.

Against the prohibited patterns:

| Pattern | Status |
|---|---|
| A TiorAI link on every tool | Not present. 18 of 120 entries (15%), each chosen for a reason |
| Keyword-stuffed anchors | Not present. Anchors are descriptive ("AI coding and development tools on TiorAI") |
| The same URL repeated many times | Not present. Every one of the 34 links is a distinct URL |
| Hidden links | Not present |
| Irrelevant links | Not present. Every category link points at a genuinely matching archive |
| Exact-match SEO anchors | Not present |
| Redirect chains for tracking | Not present. All TiorAI links are clean canonical URLs |
| UTM parameters | Not present — see below |

Three categories (image generation, data and analytics, presentations) carry **no** TiorAI
link, because no TiorAI archive matched closely enough to be worth a reader's click. Links
were left out rather than pointed at an approximate destination.

**UTM tracking:** not applied. It requires owner approval, and no prior project
convention was found. All TiorAI links are clean canonical URLs. This remains an open owner
decision; adding UTMs later is a find-and-replace on 14 links.

## Branding review

| Check | Result |
|---|---|
| Logo used | No. TiorAI logo files exist in the theme but carry a proprietary licence. Bundling them into a repository about to be published under an open content licence would implicitly relicense them. Text attribution used instead |
| Marketing banners | None |
| Sales calls to action | None |
| Repeated brand sections | None. One introduction line, one About section |
| Unverifiable claims about TiorAI | None. The About section says what TiorAI is and nothing more |

## Copy quality review

Every description was read back in category blocks, looking for the failure modes listed
below.

| Check | Result |
|---|---|
| Repeated sentence templates | None. The most-repeated two-word opening appears in 2 of 120 descriptions |
| Duplicate wording between entries | None found |
| "AI-powered" | **0 occurrences** |
| Superlatives ("best", "leading", "revolutionary", "cutting-edge", "seamless", "powerful") | **0 occurrences**, checked automatically |
| Unverifiable claims (user counts, funding, awards, rankings) | None |
| Vendor marketing copy | None. All 120 written from scratch |
| Generic AI-assistant phrasing | None found |
| Excessive em dashes | The em dash appears only as the entry separator, never inside a description |
| Grammar and capitalisation | Reviewed; product names match vendor spelling, including `Leonardo.Ai`, `n8n`, `Presentations.AI` |

The source catalogue's descriptions follow a single template
(`{Name} is an AI-powered {noun} that {verb}s…`) at scale. None was reused. See
the portfolio data audit.

## The README-without-TiorAI test

This is a mandatory gate: with all TiorAI branding and links removed, would a GitHub user
still find this useful enough to star, fork, or contribute to?

Removing all 14 TiorAI links deletes 11 one-line "More:" footers, one clause in the intro, and
the About section. What remains is 120 verified tools with descriptions, pricing labels, and
platform labels across 14 categories; a stated selection policy; a documented removal policy;
and working contribution templates.

**The list survives the removal intact**, because TiorAI never carried the value — the
curation and the verification did. The gate passes.

## Remaining warnings

| Warning | Assessment |
|---|---|
| `adobe.com` shared by two entries | Reviewed and accepted. Distinct products on distinct subdomains |
| 13 URLs unreachable to an automated checker | Bot protection, one self-inflicted rate limit, and one local TLS limitation. All confirmed live by a second route. Expect the same on any future automated re-check |
| Badge counts are hardcoded (`tools-120`, `categories-14`) | Must be updated by hand when the list changes. Flagged in the pre-publish checklist |
| `Last reviewed: 2026-08-18` in the README | A promise. If the list is not re-reviewed, the date becomes a liability |
| Contributor Covenant 2.1 used; version 3.0 exists | 2.1 remains the most widely deployed version and is what GitHub's community profile recognises. Owner may upgrade |

None blocks publication.

## Blocking items

**None.**

The one item outstanding when this report was first written — the content licence — has been
resolved. The owner chose **CC BY 4.0**, and the canonical Creative Commons text is committed
as `LICENSE`, byte-identical to the version published at creativecommons.org so that GitHub's
licence detector recognises it. The README's License section and badge were updated to match.

## Verdict

**PASS.**

Content, structure, links, templates, licence, and safety checks all pass with zero unresolved
defects. The repository is commit-ready and has not been pushed anywhere.

Publication is now purely a matter of the owner creating the remote and pushing.
