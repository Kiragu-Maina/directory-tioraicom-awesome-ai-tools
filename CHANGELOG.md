# Changelog

Notable changes to this list. Typo fixes and small wording tweaks are not logged.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## 1.0.0 — 2026-08-18

Initial public-ready release.

### Added

- 120 curated AI tools across 14 categories, each with an official link, a written
  description, a pricing label, and platform labels where they are reliable.
- Categories: AI assistants, coding, writing, research, productivity, image generation,
  video, audio and voice, design, marketing and SEO, sales and support, automation and
  agents, data and analytics, presentations.
- Contribution files: `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` (Contributor Covenant 2.1),
  `SECURITY.md`.
- `LICENSE` — CC BY 4.0, canonical Creative Commons text.
- `README.ar.md` — full Arabic edition: all 120 entries, both TiorAI link sets, and a
  legend explaining the English pricing and platform labels. Language switcher at the top
  of both files.
- A "Recently added" section at the top of each README, capped at five entries.
- Eighteen entries (15%) end with a link to a matching TiorAI comparison or alternatives
  page, placed where a reader is most likely to want that specific follow-up.
- Issue forms for suggesting a tool and reporting a broken link, plus a pull request
  template and issue template configuration.
- `.editorconfig`, `.gitattributes`, and `.gitignore`.
- `docs/` covering the input audit, reference review, data audit, editorial taxonomy,
  candidate pool, QA report, and pre-publish checklist.
- `scripts/qa-check.ps1`, an optional local validator for ordering, duplicates, labels,
  and links. The list does not depend on it.

### Notes

- Every official URL was checked before release. Entries whose product had been
  discontinued, absorbed, or renamed were corrected or dropped rather than carried over.
- Affiliate and referral parameters present in the upstream TiorAI catalogue were stripped;
  all outbound links are clean canonical URLs.
- Licensed under CC BY 4.0. A Creative Commons licence was chosen over a software licence
  such as MIT because this repository is edited prose and links, not code.
