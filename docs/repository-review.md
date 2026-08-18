# Repository and pattern review (Phase 1)

What was looked at before building this list, and what was taken from it. No editorial
content, descriptions, or category wording was copied from any of these repositories.

## Repositories and guidance reviewed

| Source | What it is | Why it was useful |
|---|---|---|
| [sindresorhus/awesome](https://github.com/sindresorhus/awesome) — `awesome.md` | The Awesome list manifesto and guidelines | The authoritative convention set: entry format, licensing, contributing file, badge rules |
| [mahseema/awesome-ai-tools](https://github.com/mahseema/awesome-ai-tools) | The largest general AI tools list on GitHub | Closest direct comparison. Strong TOC, weak curation discipline |
| [e2b-dev/awesome-ai-agents](https://github.com/e2b-dev/awesome-ai-agents) | AI agents list, ~29k stars | Very high contribution volume; shows what a heavily-forked list looks like at scale |
| [awesome-selfhosted/awesome-selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted) | Self-hosted software, ~313k stars | The reference case for per-entry metadata labels on a huge, maintained list |
| [GitHub Docs — issue forms and `config.yml`](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository) | Platform documentation | Confirmed current requirements for `.github/ISSUE_TEMPLATE/*.yml` |

## What works

**A Contents block that maps one-to-one onto the headings.** Every list that is pleasant to
use has one, and the anchors match the headings exactly. It is the only navigation a long
README gets.

**One rigid entry format, applied everywhere.** The lists that scan well never vary the
shape of a line. Once a reader has parsed one entry they have parsed all of them.

**Per-entry metadata labels.** `awesome-selfhosted` appends licence and language to every
entry, and it is the single feature that makes a 300k-star list usable rather than an
undifferentiated wall of links. The same trick applied to pricing is directly transferable:
"is this free?" is the first question anyone asks about an AI tool.

**Issue forms rather than free text.** Structured `.yml` forms with required fields and
dropdowns turn a vague suggestion into something a maintainer can action in a minute.

**Visible removal policy.** The lists that stay credible are the ones that delete dead
entries, and say that they do.

## What does not work

**Affiliate links in a curated list.** `mahseema/awesome-ai-tools` has an "Editor's Choice"
block containing affiliate URLs. Once a reader spots one, every other entry becomes suspect —
they can no longer tell curation from paid placement. This is the single most damaging
pattern observed, and it is invisible until you hover a link.

**Entries with no description.** Roughly 15–20% of entries in the largest AI tools list are a
bare link. A link with no explanation is not curation, it is a bookmark dump, and it pushes
the work of evaluating the tool back onto the reader.

**Category sprawl.** Deeply nested subcategories with three entries each mean the Contents
block becomes longer than some of the sections it points to. Sub-sub-categories are where
these lists stop being navigable.

**No CONTRIBUTING file.** Several large lists have none. The result is visible in their issue
trackers: submissions in inconsistent formats, no disclosure of vendor relationships, and
maintainers repeating the same instructions in comment threads.

**Stale entries.** Every AI list reviewed still contains products that have shut down or been
absorbed. Nobody re-checks. This is the default failure mode of the genre, not an exception.

**"Best" and "Top" framing.** Ranked ordering with no published methodology invites an
endless argument about position and quietly implies a judgement the maintainer cannot defend.

## Lessons applied

1. **Every entry gets a description. No exceptions.** All 120 entries have one, written for
   this list, 8–25 words.
2. **Pricing labels on every entry, from a fixed five-word vocabulary.** Borrowed directly
   from the `awesome-selfhosted` metadata pattern. Platform labels are optional and applied
   only where reliable — a wrong label is worse than none.
3. **Zero affiliate links, stated in the README rather than merely practised.** The upstream
   TiorAI catalogue contained affiliate parameters on some outbound URLs; every one was
   stripped. See the portfolio data audit.
4. **Fourteen flat categories, no nesting.** One primary category per tool. The Contents
   block fits on a screen.
5. **Alphabetical ordering, stated explicitly as carrying no meaning.** Removes the ranking
   argument entirely.
6. **Verify before listing, not after.** Checking every URL before release caught a
   discontinued product, two acquisitions, and a rename that every other AI list still has
   listed under the old name. Details in [qa-report.md](qa-report.md).
7. **Structured issue forms with mandatory relationship disclosure.** Founder submissions are
   explicitly welcome, which makes the disclosure requirement enforceable rather than
   adversarial.
8. **A written removal policy.** `SECURITY.md` states that unsafe links get pulled first and
   discussed afterwards, and `CHANGELOG.md` records removals.
9. **No Awesome badge.** The badge signals inclusion in the official Awesome index. This list
   has not been submitted, so displaying it would be misleading.

## How this list differentiates

The general AI tools lists on GitHub compete on size. Several claim thousands of entries;
none of them can have checked them recently, and it shows.

This one competes on the opposite axis:

- **120 entries, all verified in one pass**, on a stated date shown in the README.
- **Pricing on every line**, so the list answers the first practical question without a click.
- **Descriptions that say what a tool does**, not what its marketing team says it does.
- **A visible editorial policy** — how tools get in, how they get removed, and the fact that
  nothing here is paid for.
- **Renames and acquisitions tracked.** Three entries in this release exist because a product
  changed identity between the source catalogue and publication.

TiorAI's catalogue of 14,700 tools is what made the shortlisting possible, but the point of
this repository is the 120 that survived it, not the 14,700 that did not.
