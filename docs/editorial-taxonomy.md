# Editorial taxonomy (Phase 3)

How TiorAI's 1,751 `tool_category` terms became 14 categories for this list.

## The problem

TiorAI's taxonomy is built for search. It rewards granularity: a term for every phrase a
person might type. That produces `AI Chat Generator`, `AI Chatbot`, `AI Chatbot &
Conversational Tools`, and `Conversational AI` as four separate terms, which is correct for a
directory and useless in a Markdown list where a reader has to scan the Contents block and
pick one.

A GitHub list needs the opposite property: **the smallest set of categories a reader can hold
in their head at once.**

So the taxonomy here is not derived from TiorAI's. It is a fresh set, built to answer "what am
I trying to get done", and then checked against the catalogue to confirm each one had enough
strong candidates.

## Design rules

1. Every category holds at least 8 entries. The floor is 4; 8 was used, because a category
   with 4 entries reads as an afterthought.
2. No nesting. Flat headings only.
3. The name must be understandable without explanation, by someone who does not work in AI.
4. One primary category per tool. No cross-listing.
5. No TiorAI-internal wording that only makes sense inside WordPress.
6. Categories are ordered by expected reader interest, not alphabetically. Entries *within*
   each category are alphabetical.

## Final categories

| # | Category | Entries | Covers |
|---|---|---:|---|
| 1 | AI assistants | 9 | General chat assistants and answer engines |
| 2 | AI coding | 10 | Editors, coding agents, code review |
| 3 | AI writing | 9 | Drafting, editing, translation, proofreading |
| 4 | AI research | 9 | Literature search, paper reading, evidence checking |
| 5 | AI productivity | 8 | Meetings, notes, scheduling, desktop workflow |
| 6 | AI image generation | 9 | Generating and editing still images |
| 7 | AI video | 8 | Video generation, avatars, editing |
| 8 | AI audio and voice | 9 | Speech synthesis, transcription, music, audio repair |
| 9 | AI design | 8 | Interface design, branding, site building |
| 10 | AI marketing and SEO | 8 | Content optimisation, social, audience research |
| 11 | AI sales and support | 8 | Prospecting, revenue intelligence, customer agents |
| 12 | AI automation and agents | 9 | Workflow builders, agent frameworks, browser automation |
| 13 | AI data and analytics | 8 | Analysis platforms, model tooling, vector search |
| 14 | AI presentations | 8 | Decks, diagrams, visual documents |

**Total: 120 tools, 14 categories.** Fourteen sits at the top of the 10–14 range set for this
build and is the largest set that still fits on one screen in the Contents block.

## Mapping from TiorAI

TiorAI's 28 public top-level categories, and where each landed.

| TiorAI category | This list |
|---|---|
| Chatbots & Virtual Companions | AI assistants |
| Coding & Development | AI coding |
| Writing & Editing | AI writing |
| Research & Data Analysis | Split: AI research (literature) / AI data and analytics (business data) |
| Office & Productivity | AI productivity |
| Art & Creative Design | Split: AI image generation (generative) / AI design (interface and brand) |
| Video & Animation | AI video |
| Music & Audio | AI audio and voice |
| Marketing & Advertising | AI marketing and SEO |
| Social Media | Merged into AI marketing and SEO |
| Sales & CRM | AI sales and support |
| Customer Support & Service | Merged into AI sales and support |
| Automation & Workflows | AI automation and agents |
| Business Management | Distributed by function; no direct equivalent |
| Content, Media & Communication | Distributed across writing, video, audio |
| Cloud, Data & Infrastructure | Partly into AI data and analytics |
| Education & Translation | Translation into AI writing; education dropped |
| Legal & Finance | Dropped |
| Health & Wellness | Dropped |
| E-commerce & Retail | Dropped |
| Daily Life | Dropped |
| Business Research | Merged into AI data and analytics |
| Image Analysis | Merged into AI image generation |
| Interior & Architectural Design | Dropped |
| Virtual, AR/VR & Metaverse | Dropped |
| Security, Privacy & Compliance | Dropped |
| IoT, Robotics & Hardware | Dropped |
| Other | Dropped |

## Decisions worth explaining

### Splitting "Research & Data Analysis"

TiorAI's largest research category (1,417 tools) mixes two audiences who never overlap: an
academic doing a literature review, and an analyst querying a warehouse. Elicit and Hex have
nothing to say to each other. Split into **AI research** and **AI data and analytics**.

### Splitting "Art & Creative Design"

Same reasoning. "I want to generate an image" and "I want to design an interface" are
different jobs, different tools, different people. Midjourney and Uizard do not belong under
one heading. Split into **AI image generation** and **AI design**.

### Merging social media into marketing

TiorAI keeps `Social Media` separate (552 tools). At this scale it would have held four or
five scheduling tools, all of which are marketing tools. Merged.

### Merging customer support into sales

`Sales & CRM` and `Customer Support & Service` are separate in TiorAI. In practice the same
products increasingly serve both, and neither could reach eight strong entries alone. Merged
into **AI sales and support**, which reaches eight comfortably.

### Dropping the vertical categories

Legal, finance, health, e-commerce, interior design, AR/VR, robotics, education, and daily
life were all dropped. Each could have been filled, but they fail the "does this belong in a
general list" test: a reader looking for AI legal tools wants a specialist list, and a
general list with one thin legal section serves them worse than not pretending to cover it.
This is also where a second repository would start.

### Dropping "AI Assistants" as a catch-all

The category is limited to general-purpose chat assistants and answer engines. Local model
runners (Ollama, LM Studio, Jan) were considered and left out: they are infrastructure for
running models, which is a different job from using an assistant, and there were not eight
strong candidates to justify a separate category. A candidate for V2.

### Categories NOT created

| Considered | Why not |
|---|---|
| AI local models / self-hosted | Fewer than 8 strong entries once infrastructure tools were separated from assistants. Good V2 candidate |
| AI education | Would have been study aids overlapping heavily with writing and research |
| AI legal, AI finance, AI health | Vertical lists need vertical expertise. Better as separate repositories |
| AI translation | Only DeepL survived selection. Folded into AI writing |
| AI 3D and games | Two entries. Not a category |
| AI security | The strong tools are security products with AI features, not AI products |
| AI browser extensions | A distribution channel, not a use case. Handled by the platform label |

## Ordering

**Within a category: alphabetical by tool name**, ignoring a leading article. Neutral,
predictable, and it makes an out-of-place insertion visible in a diff during review.

The README states explicitly that position carries no meaning, so that first place is not
read as an endorsement.

**Between categories: by expected reader interest.** Assistants and coding first because they
are what most people arrive looking for; presentations last. This ordering is editorial and
can change without affecting anything else.

## Category naming

Sentence case, per this repository's Markdown style rules: **AI coding**, not *AI Coding*. "AI" is an
initialism and stays capitalised.

"and" rather than "&" — an ampersand in a heading produces a double-hyphen anchor
(`#ai-audio--voice`), which is easy to get wrong by hand when editing the Contents block.
"and" gives clean, predictable anchors.

## Review trigger

Revisit the taxonomy when any of these is true:

- A category drops below 6 entries after removals.
- A category passes 15 entries and needs splitting.
- A rejected category reaches 8 strong candidates.
- Two categories start receiving the same submissions, which means the boundary is unclear to
  readers rather than to maintainers.
