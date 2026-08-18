# Candidate pool (Phase 4)

The working shortlist behind the published list. This documents what was considered, what was
verified, and what was left out.

Two things are deliberately **not** here, and neither is an oversight:

- **Internal scores and rejection notes for individual products.** Editorial scoring stays
  out of the public repository. Exclusion reasons below are given as neutral categories, not
  as judgements on specific companies.
- **Per-tool TiorAI URLs.** Capturing a TiorAI link for every candidate would produce a
  120-line backlink map in a public file. Catalogue presence is recorded as a yes/no instead,
  and the internal slug mapping stays out of this repository.

## Pool size

| Stage | Count |
|---|---|
| Names probed against the TiorAI catalogue | 365 |
| Matched to a catalogue record (exact title, title variant, or domain) | 250 |
| Carried into category balancing | ~190 |
| **Included in v1.0.0** | **120** |
| Considered and not included | ~245 |

The pool sits inside the 250–400 target set for this build. Matching used three passes, because the
catalogue title is often not the product name: Cursor is filed as `Cursor AI`, Zapier as
`Zapier AI`, Make as `Make (Integromat)`, Gong as `Gong.io`, and Lovable under its former
`gptengineer.app` name. Exact-title matching alone found 190 of the 250; domain matching found
the rest.

## Verification status

Every one of the 120 included tools was verified before release:

- Canonical URL requested over HTTP and the final resolved URL recorded.
- Product confirmed to still exist under the listed name.
- Pricing label checked against the vendor's own pricing page.
- Platform labels applied only where confirmed; dropped where uncertain.
- Checked for duplication by normalised name and by registrable domain.

Twelve sites return `403` or `429` to automated requests behind a bot-protection layer. Those
were confirmed live by a second route (host response on a non-challenged path, plus the
vendor's own documentation or help centre) rather than being recorded as broken. A block is
not a death certificate. See [qa-report.md](qa-report.md).

## Included — 120 tools

Verification status is `Verified` for every row: URL resolved, product confirmed live,
pricing checked against the vendor's own pages, on 2026-08-18.

| Tool | Category | Official URL | Labels | Description as published |
|---|---|---|---|---|
| ChatGPT | AI assistants | https://chatgpt.com/ | Freemium, Web, iOS, Android, API | OpenAI's assistant for conversation, analysis, and file work, with web search and custom GPTs. |
| Claude | AI assistants | https://claude.ai/ | Freemium, Web, iOS, Android, API | Anthropic's assistant, aimed at long documents, careful reasoning, and code. |
| DeepSeek | AI assistants | https://www.deepseek.com/ | Freemium, Web, API | Chat assistant backed by openly licensed reasoning models, notable for low API pricing. |
| Gemini | AI assistants | https://gemini.google.com/ | Freemium, Web, iOS, Android | Google's assistant, tied into Search, Workspace, and Android. |
| Grok | AI assistants | https://grok.com/ | Freemium, Web, iOS, Android | xAI's assistant, with live access to posts on X. |
| Microsoft Copilot | AI assistants | https://copilot.microsoft.com/ | Freemium, Web, Windows, iOS, Android | Assistant built into Windows, Edge, and the Microsoft 365 apps. |
| Mistral AI | AI assistants | https://mistral.ai/ | Freemium, Web, API | European lab behind the Le Chat assistant and a family of open-weight models. |
| Perplexity | AI assistants | https://www.perplexity.ai/ | Freemium, Web, iOS, Android | Answer engine that searches the web and cites its sources inline. |
| Poe | AI assistants | https://poe.com/ | Freemium, Web, iOS, Android | One interface for models from several labs, plus bots built by other users. |
| Aider | AI coding | https://aider.chat/ | Open Source, CLI | Terminal pair programmer that edits files in your local repo and commits as it goes. |
| Bolt | AI coding | https://bolt.new/ | Freemium, Web | Prompt to a running web app in the browser, with the project editable and deployable. |
| Cline | AI coding | https://cline.bot/ | Open Source, VS Code | VS Code agent that reads the project, runs commands, and asks before applying changes. |
| CodeRabbit | AI coding | https://www.coderabbit.ai/ | Freemium, Web | Reviews pull requests line by line and comments directly on GitHub and GitLab. |
| Continue | AI coding | https://continue.dev/ | Open Source, VS Code, JetBrains | Autocomplete and chat in your editor, pointed at whichever model you choose to run. |
| Cursor | AI coding | https://cursor.com/ | Freemium, Windows, macOS, Linux | Editor built around codebase-aware chat and multi-file edits. |
| Devin | AI coding | https://devin.ai/ | Paid, Web, Windows, macOS, Linux | Cognition's coding agent, and now the desktop IDE that replaced Windsurf. |
| GitHub Copilot | AI coding | https://github.com/features/copilot | Freemium, VS Code, JetBrains, CLI | Completion, chat, and pull request help inside common editors and on GitHub itself. |
| Replit | AI coding | https://replit.com/ | Freemium, Web | Browser IDE with an agent that scaffolds, runs, and hosts projects without local setup. |
| Tabnine | AI coding | https://www.tabnine.com/ | Freemium, VS Code, JetBrains | Code completion with self-hosted and air-gapped deployment for regulated teams. |
| Copy.ai | AI writing | https://www.copy.ai/ | Freemium, Web | Templates and workflows for marketing copy, aimed at teams producing at volume. |
| DeepL | AI writing | https://www.deepl.com/ | Freemium, Web, Windows, macOS, iOS, Android, API | Translation known for natural phrasing, plus a separate tool for rewriting tone and register. |
| Grammarly | AI writing | https://www.grammarly.com/ | Freemium, Web, Windows, macOS, Browser Extension | Grammar, clarity, and tone suggestions wherever you happen to be typing. |
| Jasper | AI writing | https://www.jasper.ai/ | Paid, Free Trial, Web | Brand-voice writing platform for marketing teams, with campaign and workflow tooling. |
| LanguageTool | AI writing | https://languagetool.org/ | Freemium, Open Source, Web, Browser Extension | Proofreading in more than 30 languages; the core engine is open source and self-hostable. |
| ProWritingAid | AI writing | https://prowritingaid.com/ | Freemium, Web, Windows, macOS, Browser Extension | Line editing plus structural reports on pacing, repetition, and readability, built for long-form. |
| QuillBot | AI writing | https://quillbot.com/ | Freemium, Web, Browser Extension | Paraphrasing, summarising, and citation help, widely used by students. |
| Sudowrite | AI writing | https://sudowrite.com/ | Paid, Free Trial, Web | Drafting tool built for fiction, with beat-by-beat expansion and character tracking. |
| Wordtune | AI writing | https://www.wordtune.com/ | Freemium, Web, Browser Extension | Rewrites a sentence several ways so you can pick the register you actually want. |
| ChatPDF | AI research | https://www.chatpdf.com/ | Freemium, Web | Ask questions against an uploaded PDF and get answers with page references. |
| Connected Papers | AI research | https://www.connectedpapers.com/ | Freemium, Web | Builds a similarity graph around one paper so you can see the surrounding literature. |
| Consensus | AI research | https://consensus.app/ | Freemium, Web | Searches peer-reviewed papers and summarises where the evidence actually lands. |
| Elicit | AI research | https://elicit.com/ | Freemium, Web | Screens papers and extracts findings into a comparable table for literature reviews. |
| Gemini Notebook | AI research | https://notebook.google/ | Freemium, Web | Formerly NotebookLM: grounds answers strictly in sources you upload, and generates briefings from them. |
| ResearchRabbit | AI research | https://www.researchrabbit.ai/ | Free, Web | Follows citation trails out from a seed set of papers and alerts you to new ones. |
| SciSpace | AI research | https://scispace.com/ | Freemium, Web | Reading assistant that explains passages, maths, and tables inside academic papers. |
| Scite | AI research | https://scite.ai/ | Paid, Free Trial, Web, Browser Extension | Shows whether later papers supported or disputed a claim, not merely that they cited it. |
| Semantic Scholar | AI research | https://www.semanticscholar.org/ | Free, Web, API | Free academic search and citation graph from the Allen Institute for AI. |
| Bardeen | AI productivity | https://www.bardeen.ai/ | Freemium, Browser Extension, Web | Browser automations that move data between SaaS tools without writing scripts. |
| Fireflies.ai | AI productivity | https://fireflies.ai/ | Freemium, Web | Joins calls, transcribes them, and makes the archive searchable across a team. |
| Krisp | AI productivity | https://krisp.ai/ | Freemium, Windows, macOS | Strips background noise and echo from calls on-device, and takes meeting notes. |
| Motion | AI productivity | https://www.usemotion.com/ | Paid, Free Trial, Web, iOS, Android | Rebuilds your calendar automatically as tasks slip and meetings move. |
| Notion AI | AI productivity | https://www.notion.com/product/ai | Paid, Web, Windows, macOS, iOS, Android | Writing, summarising, and search across a Notion workspace and connected apps. |
| Otter.ai | AI productivity | https://otter.ai/ | Freemium, Web, iOS, Android | Live meeting transcription with speaker labels, summaries, and action items. |
| Raycast | AI productivity | https://www.raycast.com/ | Freemium, macOS, Windows | Keyboard launcher with a large extension ecosystem and built-in model access. |
| Taskade | AI productivity | https://www.taskade.com/ | Freemium, Web, macOS, Windows, iOS, Android | Shared task lists, notes, and mind maps, with agents that work on them. |
| Adobe Firefly | AI image generation | https://firefly.adobe.com/ | Freemium, Web | Image and video generation trained on licensed stock, wired into Creative Cloud. |
| Civitai | AI image generation | https://civitai.com/ | Freemium, Web | Community hub for open image models, LoRAs, and the prompts behind them. |
| Clipdrop | AI image generation | https://clipdrop.co/ | Freemium, Web, API | Background removal, upscaling, relighting, and cleanup, each as its own one-job tool. |
| Ideogram | AI image generation | https://ideogram.ai/ | Freemium, Web, iOS, Android | Image generator that handles legible text in posters, logos, and mockups. |
| Leonardo.Ai | AI image generation | https://leonardo.ai/ | Freemium, Web | Fine-tuned model presets and consistent-character tooling, popular for game and concept art. |
| Midjourney | AI image generation | https://www.midjourney.com/ | Paid, Web, Discord | Image model known for its aesthetic defaults, used through the web app or Discord. |
| Photoroom | AI image generation | https://www.photoroom.com/ | Freemium, Web, iOS, Android, API | Product photography: cut out the subject, drop in a background, batch the rest. |
| Recraft | AI image generation | https://www.recraft.ai/ | Freemium, Web | Generates vector art, icons, and mockups in a consistent style, editable afterwards. |
| Stability AI | AI image generation | https://stability.ai/ | Freemium, Open Source, Web, API | Publisher of the Stable Diffusion image models and related open-weight releases. |
| Captions | AI video | https://captions.ai/ | Freemium, iOS, Android, Web | Phone-first editor for talking-head clips: subtitles, eye contact correction, dubbing. |
| Descript | AI video | https://www.descript.com/ | Freemium, Web, Windows, macOS | Edits video by editing the transcript; delete a sentence and the footage goes with it. |
| D-ID | AI video | https://www.d-id.com/ | Freemium, Web, API | Turns a still portrait and a script into a talking avatar, with an API behind it. |
| HeyGen | AI video | https://www.heygen.com/ | Freemium, Web, API | Avatar presenters, and translation that resyncs lip movement to the new language. |
| Kling | AI video | https://kling.ai/ | Freemium, Web | Text and image to video model from Kuaishou, with camera and motion controls. |
| Luma | AI video | https://lumalabs.ai/ | Freemium, Web, iOS | Dream Machine generates video from text or a still image, alongside 3D capture tools. |
| Runway | AI video | https://runway.com/ | Freemium, Web, iOS | Video generation plus an editing suite: inpainting, motion brush, camera control. |
| Synthesia | AI video | https://www.synthesia.io/ | Freemium, Web | Studio-style avatars reading a script, aimed at training and internal communications. |
| Adobe Podcast | AI audio and voice | https://podcast.adobe.com/ | Freemium, Web | Enhance Speech cleans up room noise and makes phone audio sound close-miked. |
| AssemblyAI | AI audio and voice | https://www.assemblyai.com/ | Freemium, API | Speech-to-text API with speaker diarisation, sentiment, and topic detection built in. |
| Deepgram | AI audio and voice | https://deepgram.com/ | Freemium, API | Low-latency transcription and voice agent APIs aimed at real-time products. |
| ElevenLabs | AI audio and voice | https://elevenlabs.io/ | Freemium, Web, API | Voice synthesis, cloning, and dubbing, with fine control over delivery. |
| LALAL.AI | AI audio and voice | https://www.lalal.ai/ | Freemium, Web, Windows, macOS | Splits a finished track into vocal, drum, bass, and instrument stems. |
| Moises | AI audio and voice | https://moises.ai/ | Freemium, Web, iOS, Android | Stem separation, pitch and tempo shifting, and chord detection for practising musicians. |
| Murf | AI audio and voice | https://murf.ai/ | Freemium, Web | Voiceover studio for e-learning and explainer audio, with timing control per block. |
| Speechify | AI audio and voice | https://speechify.com/ | Freemium, Web, iOS, Android, Browser Extension | Reads documents, PDFs, and web pages aloud at adjustable speed. |
| Suno | AI audio and voice | https://suno.com/ | Freemium, Web, iOS | Generates complete songs, vocals included, from a text prompt. |
| Canva | AI design | https://www.canva.com/ | Freemium, Web, Windows, macOS, iOS, Android | Design editor whose Magic Studio tools generate, resize, and restyle assets in place. |
| Durable | AI design | https://durable.com/ | Freemium, Web | Produces a small business website, copy included, from a short description. |
| Framer | AI design | https://www.framer.com/ | Freemium, Web | Site builder that turns a prompt into a laid-out, publishable page you then refine by hand. |
| Looka | AI design | https://looka.com/ | Freemium, Web | Logo generator that expands the chosen mark into a basic brand kit. |
| Relume | AI design | https://www.relume.ai/ | Freemium, Web | Generates a sitemap and wireframes, then exports components into Webflow or Figma. |
| Spline | AI design | https://spline.design/ | Freemium, Web, Windows, macOS | Browser-based 3D editor with generative texture and scene tools for web-ready output. |
| Uizard | AI design | https://uizard.io/ | Freemium, Web | Converts screenshots, sketches, and prompts into editable app wireframes. |
| Visily | AI design | https://www.visily.ai/ | Freemium, Web | Wireframing for people who are not designers, with screenshot and hand-drawing import. |
| Brandwatch | AI marketing and SEO | https://www.brandwatch.com/ | Paid, Web | Social listening across public conversation, with clustering and sentiment analysis. |
| Clearscope | AI marketing and SEO | https://www.clearscope.io/ | Paid, Web | Grades draft content against what already ranks, used mainly by editorial teams. |
| Frase | AI marketing and SEO | https://www.frase.io/ | Paid, Free Trial, Web | Builds briefs from search results, then drafts against the brief. |
| Later | AI marketing and SEO | https://later.com/ | Freemium, Web, iOS, Android | Social scheduling with caption suggestions and posting-time recommendations. |
| MarketMuse | AI marketing and SEO | https://www.marketmuse.com/ | Freemium, Web | Audits a site's topic coverage and points at the gaps worth filling. |
| Ocoya | AI marketing and SEO | https://www.ocoya.com/ | Paid, Free Trial, Web | Writes, designs, and schedules social posts from a single queue. |
| Sprout Social | AI marketing and SEO | https://sproutsocial.com/ | Paid, Free Trial, Web, iOS, Android | Social management suite with assisted replies and inbox triage. |
| Surfer SEO | AI marketing and SEO | https://surferseo.com/ | Paid, Web, Browser Extension | On-page optimisation scoring tied to live analysis of the results page. |
| Apollo.io | AI sales and support | https://www.apollo.io/ | Freemium, Web, Browser Extension | Prospect database with sequencing and call recording in the same workspace. |
| Chatbase | AI sales and support | https://www.chatbase.co/ | Freemium, Web, API | Builds a support chatbot from your docs and site, embeddable in a few lines. |
| Clari | AI sales and support | https://www.clari.com/ | Paid, Web | Forecasting and pipeline inspection, drawing on call activity and CRM signals. |
| Clay | AI sales and support | https://www.clay.com/ | Freemium, Web | Enriches lead lists from many data sources and drafts outreach row by row. |
| Gong | AI sales and support | https://www.gong.io/ | Paid, Web | Records and analyses sales calls to surface what separates won deals from lost ones. |
| Instantly | AI sales and support | https://instantly.ai/ | Paid, Free Trial, Web | Cold email sending with inbox warm-up and deliverability monitoring. |
| Sierra | AI sales and support | https://sierra.ai/ | Paid, Web, API | Customer service agents that follow company policy and hand off to a human cleanly. |
| Voiceflow | AI sales and support | https://www.voiceflow.com/ | Freemium, Web | Visual builder for chat and voice agents, with team review before release. |
| AutoGPT | AI automation and agents | https://agpt.co/ | Open Source, Web, CLI | The early autonomous agent project, now a platform for building and running agent workflows. |
| Browse AI | AI automation and agents | https://www.browse.ai/ | Freemium, Web, Browser Extension | Point-and-click scrapers that watch a page and emit structured data on a schedule. |
| Gumloop | AI automation and agents | https://www.gumloop.com/ | Freemium, Web | Node-based canvas where model calls sit alongside ordinary automation steps. |
| LangChain | AI automation and agents | https://www.langchain.com/ | Freemium, Open Source, API, CLI | Framework for composing model calls, tools, and retrieval into applications. |
| Lindy | AI automation and agents | https://www.lindy.ai/ | Freemium, Web | Assistants that handle email, scheduling, and CRM updates from plain instructions. |
| Make | AI automation and agents | https://www.make.com/ | Freemium, Web | Visual integration builder with a large connector library and real branching logic. |
| n8n | AI automation and agents | https://n8n.io/ | Freemium, Web, Linux, CLI | Source-available workflow automation you can self-host, with native agent nodes. |
| UiPath | AI automation and agents | https://www.uipath.com/ | Paid, Free Trial, Web, Windows | Enterprise RPA platform that has grown document understanding and agent orchestration. |
| Zapier | AI automation and agents | https://zapier.com/ | Freemium, Web | Connects thousands of apps; its agents and chatbots run on the same triggers. |
| AlphaSense | AI data and analytics | https://www.alpha-sense.com/ | Paid, Web | Market intelligence search across filings, broker research, and earnings calls. |
| Dataiku | AI data and analytics | https://www.dataiku.com/ | Freemium, Web | Data prep, modelling, and deployment on one platform, for mixed technical teams. |
| H2O.ai | AI data and analytics | https://h2o.ai/ | Freemium, Open Source, Web, API | AutoML and model-serving stack built on an open-source core. |
| Hex | AI data and analytics | https://hex.tech/ | Freemium, Web | Collaborative notebooks mixing SQL, Python, and generated queries into shareable apps. |
| Obviously AI | AI data and analytics | https://obviously.ai/ | Paid, Free Trial, Web | Trains and deploys prediction models from spreadsheet data without code. |
| Pinecone | AI data and analytics | https://www.pinecone.io/ | Freemium, API | Managed vector database for retrieval over embeddings, with no infrastructure to run. |
| Qdrant | AI data and analytics | https://qdrant.tech/ | Freemium, Open Source, API | Vector database with rich filtering, available self-hosted or managed. |
| Weights & Biases | AI data and analytics | https://wandb.ai/ | Freemium, Web, API | Experiment tracking, evaluation, and a model registry for ML teams. |
| Beautiful.ai | AI presentations | https://www.beautiful.ai/ | Paid, Free Trial, Web | Slides that re-flow their own layout as content changes, keeping spacing consistent. |
| Decktopus | AI presentations | https://www.decktopus.com/ | Freemium, Web | Generates a deck with speaker notes from a topic and an audience description. |
| Gamma | AI presentations | https://gamma.app/ | Freemium, Web | Prompt to a deck, doc, or site that scrolls like a web page instead of paginating. |
| MagicSlides | AI presentations | https://www.magicslides.app/ | Freemium, Web | Google Slides add-on that turns a topic or a block of text into slides. |
| Napkin | AI presentations | https://www.napkin.ai/ | Freemium, Web | Turns written text into editable diagrams and charts for slides and documents. |
| Presentations.AI | AI presentations | https://www.presentations.ai/ | Freemium, Web | Deck generation with brand templates and version control for teams. |
| Slidebean | AI presentations | https://slidebean.com/ | Freemium, Web | Pitch deck tool with investor-oriented templates and design-on-demand. |
| SlidesAI | AI presentations | https://www.slidesai.io/ | Freemium, Web | Add-on that converts text into Google Slides or PowerPoint decks. |

## Not included

Grouped by reason. A tool appearing here is not a judgement on its quality — most were left
out because the category was already well covered at 8–10 entries.

### Removed on verification (product no longer exists as listed)

These reached the final verification pass and failed it. This is the group that justifies the
verification step existing.

| Tool | Finding |
|---|---|
| Sora | Discontinued. App closed 26 April 2026, API closes 24 September 2026 |
| Podcastle | `podcastle.ai` redirects to `async.com`, a repositioned video product |
| MonkeyLearn | Shut down |
| Codeium / Windsurf | Acquired by Cognition; domain redirects to `devin.ai/desktop`. Relisted as **Devin** |
| NotebookLM | Renamed to **Gemini Notebook** on 16 July 2026. Relisted under the current name |
| Tome | Product repositioned away from presentations since it was catalogued |
| Adept, Regie.ai, Lavender | Could not be confirmed as independently operating |

### Excluded — AI is not the primary purpose

Strong products where AI is a feature rather than the point. Listing them would dilute what
the categories mean.

Figma, Obsidian, Zotero, Todoist, ClickUp, Sunsama, CapCut, Prezi, Buffer, Hootsuite,
Mailchimp, Tableau, Power BI, Snyk, DeepSource, Sourcegraph, Intercom, Zendesk, AlsoAsked.

### Excluded — category already covered

The largest group. Each of these is a reasonable tool that lost a slot to a stronger or more
differentiated entry in the same category.

- **Assistants:** You.com, Meta AI, Character.AI, Cohere, HuggingChat, Kimi, Qwen, Pi
- **Local model runners:** Ollama, LM Studio, Jan, GPT4All, Open WebUI, Chatbox, Msty,
  TypingMind — see [editorial-taxonomy.md](editorial-taxonomy.md) on why there is no category
  for these yet
- **Coding:** Mintlify, Qodo, Greptile, Phind, Warp, Zed, Supermaven, Bito, Refact.ai,
  Amazon Q Developer, JetBrains AI Assistant
- **Writing:** Writesonic, Rytr, Anyword, Lex, Hypotenuse AI, Textio, Paperpal, NovelAI,
  Simplified, Peppertype.ai, Wordvice AI, Sassbook
- **Research:** Litmaps, Iris.ai, Explainpaper, Genei, Humata, Scholarcy, Petal, Inciteful,
  Undermind
- **Productivity:** Tactiq, Supernormal, Clockwise, Sembly AI, Akiflow, Superhuman, Shortwave,
  Granola, Read AI, Mem, Reclaim, Napkin (listed under presentations instead)
- **Image:** Playground, NightCafe, Lexica, DreamStudio, Freepik, Remove.bg, Upscayl,
  Cleanup.pictures, Magnific, Topaz Photo AI, ComfyUI, Fooocus, Automatic1111,
  Bing Image Creator, DALL-E 3 (reached through ChatGPT)
- **Video:** InVideo, Pictory, Fliki, Colossyan, Veed, Steve AI, Elai.io, Vidyo.ai, Kaiber,
  Hour One, Wondershare Filmora, Topaz Video AI, Pika
- **Audio:** AIVA, Soundraw, Mubert, Boomy, Auphonic, Resemble AI, WellSaid Labs, Voicemod,
  NaturalReader, Riverside, Stable Audio, Udio
- **Design:** Vizcom, Interior AI, Brandmark, LogoAI, Autodraw, Khroma, Musho, Galileo AI,
  Microsoft Designer, Wix ADI
- **Marketing:** Persado, Taplio, Postwise, Tugan.ai, Pencil, Predis.ai, AdCreative.ai,
  Lately, Phrasee, Seventh Sense, Semrush, Ahrefs
- **Sales and support:** Smartlead, Tidio, Crisp, Ada, Forethought, Drift, Outreach,
  Salesloft, Chorus, Decagon, Attention, Apollo (disambiguated from Apollo.io)
- **Automation:** Axiom, Haystack, Flowise, Langflow, Dify, Relevance AI, CrewAI, LlamaIndex,
  AutoGen, BabyAGI, MultiOn, Vellum, LangSmith, Semantic Kernel, Superagent, E2B
- **Data:** Weaviate, Milvus, Chroma, ThoughtSpot, Hebbia, Deepnote, Polymer, Rows, Equals,
  Numerous.ai, Formula Bot, DataRobot, Julius AI, Akkio, Pecan
- **Presentations:** Pitch, Slidesgo, Plus AI, Canva Magic Design

### Excluded — overlap with an entry already listed

Where a parent product and a feature of it were both candidates, only the parent was listed:
DALL-E 3 (ChatGPT), Notion (Notion AI), Jasper Art (Jasper), Descript Overdub (Descript),
Perplexity Pages (Perplexity), Replit Agent (Replit), Claude Code (Claude), OpenAI Codex
(ChatGPT).

Three vector databases were shortlisted; two were kept. A general list does not need four.

### Excluded — could not be verified confidently

A small number of candidates had a live site but not enough public information to write an
accurate description, or a pricing model that could not be confirmed from the vendor's own
pages. These were omitted rather than guessed at. They are the natural first
place to look for v1.1 additions.

## Editorial additions not in the TiorAI catalogue

Eight of the 120 have no matching catalogue record and were added because their category
would have been noticeably weaker without them. These are worth adding upstream:

| Tool | Category |
|---|---|
| Aider | AI coding |
| Cline | AI coding |
| Devin | AI coding |
| Gemini Notebook | AI research |
| Kling | AI video |
| Murf | AI audio and voice |
| Clay | AI sales and support |
| Gong | AI sales and support |

The other 112 correspond to existing catalogue records.

## Notes for the next revision

- The local model runner cluster (Ollama, LM Studio, Jan, Open WebUI, GPT4All) is the
  strongest candidate for a fifteenth category once it has 8 entries worth listing.
- Agent frameworks were thinned heavily to keep **AI automation and agents** readable. If
  reader interest is there, it splits cleanly into workflow automation and agent frameworks.
- Verticals (legal, finance, health, e-commerce) were dropped from this list entirely. They
  are better served by separate repositories than by thin sections here.
