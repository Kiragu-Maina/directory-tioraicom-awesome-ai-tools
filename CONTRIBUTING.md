# Contributing

Thanks for helping keep this list useful. Corrections are as welcome as additions — a fixed
description or a removed dead link is worth as much as a new tool.

## What qualifies

A tool is a good fit when most of these are true:

- It has a working official website and is currently available to use.
- AI is central to what the product does, not a feature added to the marketing page.
- It solves a problem a reader would recognise without needing a demo.
- There is enough public information to describe it accurately.
- It covers something the existing entries in that category do not.

We will not list:

- Broken, parked, or login-walled sites with no public information.
- Products that have shut down or been folded into something else.
- Affiliate landing pages, coupon sites, and lead-capture funnels.
- Near-identical clones with no meaningful difference.
- Anything whose main activity is clearly illegal, or NSFW-focused products.
- Tools submitted purely as a promotional exercise.

## Two ways to contribute

### Open an issue

Fastest option, and fine if you would rather not touch Markdown.

- [Suggest a tool](../../issues/new?template=suggest-a-tool.yml)
- [Report a broken link](../../issues/new?template=report-a-broken-link.yml)

### Open a pull request

Edit `README.md` directly and open a pull request. One logical change per pull request:
one tool added, or one category corrected, or one batch of dead links removed. Mixed pull
requests take much longer to review and are usually sent back.

## Entry format

Every entry follows the same shape:

```md
- **[Tool Name](https://example.com/)** — What it does, in one sentence. `Freemium` `Web`
```

Rules:

1. **Link to the official website.** Not a review page, not a directory listing, not a
   referral or affiliate link, not a URL shortener. HTTPS, and the canonical form — no
   tracking parameters, no `?utm_...`, no trailing junk.
2. **Name the product the way its own site does.** Not the SEO title, not "Tool Name AI Best
   Free Generator".
3. **Description: 8 to 25 words, 35 at the absolute most.** One sentence. Say what it does
   and who would use it.
4. **Write it yourself.** Do not paste the vendor's tagline or their homepage hero copy.
5. **No superlatives.** No "leading", "revolutionary", "best-in-class", "game-changing",
   "cutting-edge". No claims about user counts, funding, or awards.
6. **Pricing labels are fixed.** Use only `Free`, `Freemium`, `Paid`, `Open Source`,
   `Free Trial`. Up to two per entry. No dollar amounts — they go stale too fast.
7. **Platform labels are optional.** Use only where they are genuinely useful and you are
   sure: `Web`, `Windows`, `macOS`, `Linux`, `iOS`, `Android`, `API`, `CLI`,
   `Browser Extension`, `VS Code`, `JetBrains`, `Discord`. If you are guessing, leave it out.
8. **Alphabetical order within the category.** Ignore punctuation and a leading "The", so
   `Descript` comes before `D-ID`. Insert in the right place rather than appending to the end.
9. **One category per tool.** Pick the primary use case. Cross-listing the same product in
   several categories is what makes these lists unreadable.
10. **Do not add a TiorAI link to your entry.** A small number of entries end with a link to a
   TiorAI comparison or alternatives page. Those are maintainer-placed, capped at 15% of
   entries, and chosen where readers are likely to want that specific follow-up. Pull requests
   that add more will be asked to remove them.

### A worked example

```md
- **[Descript](https://www.descript.com/)** — Edits video by editing the transcript; delete a sentence and the footage goes with it. `Freemium` `Web` `Windows` `macOS`
```

## Before you open the pull request

- Search the README for the tool name **and** its domain. Renames and acquisitions mean the
  same product can already be listed under a different name.
- Open the URL in a private window and confirm it loads without a redirect chain.
- Check the pricing label against the vendor's own pricing page.
- Confirm your entry is in the right alphabetical position.

## Disclose any relationship

If you work for the company, founded it, invested in it, or are being paid to submit it, say
so in the issue or the pull request description. This is not disqualifying and it will not
count against you. Undisclosed promotion that we find later gets the entry removed.

## What happens next

Maintainers review every submission and keep final editorial control. Descriptions are often
edited for length and consistency before merging — that is normal, not a criticism of your
writing.

Submitting a tool does not guarantee it will be listed. A tool can be declined because the
category is already well covered, because we could not verify enough about it, or simply
because we did not think it earned a slot. We will say which, and there is no appeal process
beyond a polite argument in the thread.

Please read the [Code of Conduct](CODE_OF_CONDUCT.md) before taking part.
