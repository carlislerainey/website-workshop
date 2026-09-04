# Web-route Quarto site findings (political science)

Route: search engines, department job-market pages, department directories.
Method: every candidate below was fetched directly with `curl -A "Mozilla/5.0"`
and grepped/read for `<meta name="generator" content="quarto-...">` and
`site_libs/` — WebFetch's summarized text was NOT trusted as evidence for the
quarto tell (it hallucinated on at least one page, see notes on Jihyeon Bae).

7 fully verified. 3 are unambiguously current PhD students; 1 is tenure-track
faculty; 3 are very-recent PhDs / postdocs still listed on their department's
own "current job market candidates" page for 2026-27 (flagged individually —
include or cut at the coordinator's discretion).

---

## Maranda Joyce — Rice University
- site: https://marandaljoyce.github.io/
- repo: https://github.com/marandaljoyce/marandaljoyce.github.io (verified live, 200)
- status: "I am a PhD candidate in Political Science with a focus in political behavior." — from the site's own About/home page. Cross-checked: listed on Rice Political Science's official "Job Market Candidates" page (politicalscience.rice.edu/graduate/job-market-candidates), which links this exact URL.
- quarto evidence: `<meta name="generator" content="quarto-1.9.38">` + 17 `site_libs/quarto-*` script/css includes
- classification: PLAIN. Nav is About/Research/CV/Teaching (stock about-page shape). `styles.css` is fetched and is literally the unedited Quarto placeholder — `/* css styles */`, 17 bytes, no overrides. The only stylistic choice is a stock dark Bootswatch theme (`data-mode="dark"` on the bootstrap link), which is a theme pick in `_quarto.yml`, not custom CSS.
- currency: self-describes "In my job market paper..." for the 2026-2027 cycle; page fetched live 2026-09-03.
- look, in one line: headshot photo, name, "PhD Candidate, Rice University," a row of Email/Bluesky/Google Scholar/GitHub icon-buttons, then a welcome paragraph.
- flags: on 2026-27 job market; footer explicitly credits "GitHub, R, and Quarto" per a WebFetch pass (page mentions all three tools by name).

## Jihyeon Bae — University of Washington
- site: https://jihyeonbae.github.io/
- repo: https://github.com/jihyeonbae/jihyeonbae.github.io (verified live, 200)
- status: "I am Jihyeon Bae, Ph.D. in Political Science from the University of Washington (UW) (June 2026), and an incoming Postdoctoral Research Fellow at the Niehaus Center for Globalization and Governance at Princeton University." — quoted directly from the page's raw HTML (extracted via curl + python, NOT via WebFetch — see note below). Cross-checked: listed on UW Political Science's official "Hire a UW Ph.D." page (polisci.washington.edu/hire-uw-phd), which links this exact URL.
- quarto evidence: `<meta name="generator" content="quarto-1.6.42">` + full `site_libs/quarto-*` set
- classification: PLAIN. Nav is Home/CV/Research/Teaching/Software. `styles.css` is fetched and is the unedited 17-byte Quarto placeholder (`/* css styles */`) — no custom CSS at all.
- currency: PhD conferred "June 2026"; page fetched live 2026-09-03.
- look, in one line: portrait photo, "Profile" section, plain nav, no icon-button row visible in the raw markup.
- flags: PhD just conferred (June 2026), incoming postdoc at Princeton, not currently enrolled — borderline on "current student." ⚠️ A WebFetch summarization pass on this exact URL fabricated a sentence claiming the page describes Bae as "a Claude agent, built on Anthropic's Claude Agent SDK" — this is NOT in the page; it is a small-model hallucination from the WebFetch tool. Verified against raw curl'd HTML directly (quoted above) — the hallucinated sentence does not appear anywhere in the source. Flagging so nobody re-trusts that WebFetch output.

## Elizabeth Echavarría — University of Washington
- site: https://elizabeth-echavarria.github.io/
- repo: https://github.com/elizabeth-echavarria/elizabeth-echavarria.github.io (verified live, 200)
- status: "I am a Political Science Ph.D. candidate at the University of Washington in Seattle." — from the site's own home page. Cross-checked: listed on UW Political Science's official "Hire a UW Ph.D." page, which links this exact URL.
- quarto evidence: `<meta name="generator" content="quarto-1.7.32">` + full `site_libs/quarto-*` set
- classification: LIGHTLY CUSTOMIZED. Ships a real custom `styles.css` (563 lines / non-trivial byte size, confirmed by direct fetch — not the stock placeholder). Nav is reduced to CV + LinkedIn + Email icons only (no Research/Teaching tabs), which is itself a customization of the default about-page nav.
- currency: describes an active 2024-25 role and current fellowships; on UW's 2026-27 job-market page; fetched live 2026-09-03.
- look, in one line: headshot photo, substantial bio (political economy of extractive/low-carbon energy), a link explaining how to pronounce her name, list of fellowships (Clean Energy Institute, Oxford-Penn Social Impact Program, RESF, APSA).
- flags: on 2026-27 job market; currently enrolled (still says "candidate," not "PhD").

## Mitsuru Mukaigawara — Harvard University
- site: https://mitsurumukaigawara.com/
- repo: REPO NOT FOUND. Custom domain does not CNAME to GitHub Pages IPs (resolves to 18.208.88.157 / 98.84.224.111, not the 185.199.108-111.153 GitHub Pages range), so it may not even be GitHub-Pages-hosted despite being built with Quarto. His GitHub profile is confirmed (github.com/mmukaigawara, linked from the page's own footer), but `mmukaigawara.github.io` and several guessed repo names (`website`, `personal-website`, `academic-website`, `site`) all 404.
- status: "Ph.D. candidate in Government and an A.M. candidate in Statistics at Harvard University" (per a WebFetch summary of the page — used here only for the self-description sentence, corroborated independently by the Harvard Government department's own "Job Market Candidates" page at gov.harvard.edu/graduate/job-market-candidates/, which lists him and links this exact URL).
- quarto evidence: `<meta name="generator" content="quarto-1.8.26">` + 17 `site_libs/quarto-*` includes
- classification: LIGHTLY CUSTOMIZED. Featured-papers listing with thumbnail images, a distinct "News" section, dedicated Software page — more built-out than a stock about page, though still clean/academic rather than heavily branded.
- currency: on Harvard's 2026-27 "Job Market Candidates" page; fetched live 2026-09-03.
- look, in one line: minimal top bar with name, Google Scholar + project link, then CV/Job-Market-Paper/Contact buttons, then a featured-research grid with thumbnails, then a news feed.
- flags: on 2026-27 job market; weaker record (no confirmed repo) — include only if the GitHub-code-search route doesn't already have a cleaner Harvard/DDSS example.

## Carolina Torreblanca — New York University
- site: https://carolina-torreblanca.github.io/
- repo: https://github.com/carolina-torreblanca/carolina-torreblanca.github.io (verified live, 200)
- status: "I received my Ph.D. in Politics from New York University (2024)." — quoted directly from the page (extracted via curl + python). Cross-checked: listed on NYU Politics' "Hire an NYU Ph.D. Student" page (as.nyu.edu/departments/politics/hire-an-nyu-phd-student.html), which links this exact URL.
- quarto evidence: `<meta name="generator" content="quarto-1.5.56">` + full `site_libs/quarto-*` set
- classification: LIGHTLY CUSTOMIZED. Custom `theme.css` (9,379 bytes, confirmed by direct fetch), plus a light/dark mode toggle script and personal touches (a "best cover songs" page, a photo with her dog captioned "The goat Kyoshi (left) and me (right)").
- currency: bio describes current 2025-26 postdoctoral appointments; fetched live 2026-09-03.
- look, in one line: name/photo header, brief academic bio, Bluesky/email links, informal personal-interest asides mixed into an otherwise standard CV-style layout.
- flags: PhD already conferred (2024); now a postdoc (Penn PDRI-DevLab / Penn AI Fellow / external fellow at Stanford's Poverty, Violence and Governance Lab) — not a current student, but was pulled from NYU Politics' own "PhD Students on the Job Market" listing for this cycle. Field is "Politics" (NYU's departmental name), squarely political science.

## Christopher T. Kenny — Harvard University / Princeton DDSS
- site: https://christophertkenny.com/
- repo: https://github.com/christopherkenny/christopherkenny.github.io (verified live, 200 — linked directly from the site's own footer)
- status: "I received my PhD in Government from Harvard University in 2025." Currently: "I am a Postdoctoral Research Associate at Princeton Data-Driven Social Science [DDSS]." — quoted directly from the page. Cross-checked: listed on Harvard Government's own "Job Market Candidates" page for 2026-27, which links this exact URL.
- quarto evidence: `<meta name="generator" content="quarto-1.10.18">` + full `site_libs/quarto-*` set, including quarto-listing and quarto-search bundles
- classification: LIGHTLY CUSTOMIZED (heavy end of that bucket). Custom hex-sticker logo in the navbar, extra nav items beyond the stock set (Research/Teaching/Software/CV/**Quarto**/Blog — he has a dedicated page about his own Quarto templates), MathJax, iconify icons, Google Analytics, custom listing carousels on the homepage.
- currency: PhD 2025; on Harvard's 2026-27 job-market page; fetched live 2026-09-03.
- look, in one line: hex-logo navbar, research/teaching/software/CV/Quarto/blog tabs, a homepage built from Quarto listing components (recent-updates carousel, package carousel).
- flags: on 2026-27 job market; PhD in Government (Harvard's name for the poli-sci department) with a specialization in political methodology/redistricting (ALARM Project co-PI); DDSS runs Quarto/reproducibility workshops for Princeton grad students, and he is the visible face of that — good evidence this whole professional network (DDSS, ALARM, Harvard Gov methods people) is a real cluster of Quarto users, distinct from Jekyll-dominated poli-sci elsewhere. Not a current student.

## Julia Schulte-Cloos — University of Marburg
- site: https://jschultecloos.github.io/
- repo: REPO NOT FOUND. GitHub profile confirmed (github.com/jschultecloos, linked from her own page), but the public repo list from the GitHub API (up to 100 repos) does not include a `jschultecloos.github.io` entry — most likely a private source repo deploying to public Pages, which GitHub supports.
- status: "Assistant Professor of Political Science, University of Marburg" — from the page's own `<meta name="description">` and sidebar ("Assistant Professor (W1, TT W3), University of Marburg"). Faculty, not a PhD student.
- quarto evidence: `<meta name="generator" content="quarto-1.6.9">` + full `site_libs/quarto-*` set
- classification: LIGHTLY CUSTOMIZED (heavy end). Custom "Plus Jakarta Sans" webfont loaded via multiple `@font-face` declarations, custom sidebar layout (not a stock about-page), an awards line (Heinz Maier-Leibnitz Prize 2026, Emmy Noether Group OPENMIND 2026), Google Analytics.
- currency: lists 2026 awards; fetched live 2026-09-03.
- look, in one line: sidebar with avatar, name, title, awards, and a CV-download button; main pane has About/Research/Publications/Working-Papers/Contact sections.
- flags: faculty, not a PhD student — satisfies the "or political science faculty member" clause explicitly. She teaches "Reproducible Reports with Quarto and RMarkdown" workshops, which is presumably how/why her own site is Quarto-built. Good CUSTOMIZED exemplar if the handout wants one clearly-faculty case.

---

## Rejected (near-misses, one line each)

- Neomi Rao (U Chicago, poli sci PhD candidate) — real, on-topic, but built with Jekyll ("Created with Jekyll Now"), not Quarto.
- Do Won Kim (U Maryland, computational social science) — hand-coded custom JS/CSS site, no quarto tell.
- Guilherme Duque (IESP-UERJ Brazil, poli sci PhD student) — hand-coded single-file HTML/CSS (Tailwind-style), not Quarto.
- Roland Kristo (UCL, poli sci PhD candidate) — plain hand-coded HTML/CSS, no quarto tell.
- Matthew Koo, Gary Leung, Paul Lendway, Ryan Pike (all Yale/UW-Madison job-market pages) — real poli-sci PhDs/postdocs, but Jekyll (GaryKing.org/mysite template, al-folio, Minimal Mistakes) not Quarto.
- Hankyeul Yang (Texas A&M IR PhD, now Hertie postdoc) — Jekyll (academicpages/Minimal Mistakes fork).
- ~20 University of Wisconsin–Madison 2026-27 job-market candidates checked individually (Jess Esplin, Yena Kim, Oliver Lang, Jérémie Langlois, Junda Li, Marika Olijar, Priyadarshi Amar, Saloni Bhogale, Jess Howsam, Marko Kljajic, Jessie Munson, Allison Myren, Mingcong Pan, Khasan Redjaboev, Thomas Worth, Hohyun Yoon, Xunchao Zhang, Xinzhi Zhao) — real candidates, but Jekyll/al-folio/academicpages or non-Quarto custom builds throughout; this was the single largest batch checked with zero Quarto hits.
- Ohio State 2026-27 job-market candidates with github.io sites (Jungbae An, Emily Ann Israelson, Jing Luo, Daniel Naftel, Connor Tragesser) — none Quarto.
- UCLA and NYU job-market github.io candidates not already listed above (Soonhong Cho, Shing Hon Lam, Ayoung Chun, Ivan San Miguel) — none Quarto.
- Northwestern (Qin Huang) and Cornell (Michael Kriner) job-market github.io candidates — none Quarto.
- University of Rochester current PhD students (Alice Brocheux, Kirill Kazantcev, Jefferson Leal, Adam Roberts, Matteo Bertoli) — Rochester's PhD directory itself was a great source of real personal sites, but every one checked is al-folio (Jekyll) or hand-coded; Rochester appears to be an al-folio department, not a Quarto one.
- Duke PhD students (Trung-Anh Nguyen, Benjamin Krick) — al-folio (Jekyll).
- Christopher T. Kenny's Harvard/DDSS colleagues Cory McCartan (corymccartan.com, generator=Hugo) and Connor Jerzak (UT Austin faculty, connorjerzak.com, generator=Redux/WordPress) — both quant political scientists, neither Quarto.
- Jacob Winter and Ludovic Rheault (University of Toronto poli sci) — a WebSearch summary incorrectly claimed Winter's site was "built with Quarto"; direct verification showed academicpages/Jekyll for both. Flagging because it's a concrete example of a search-summary hallucination caught by raw-HTML verification.
- Zhaomin Li (UW-Madison job market) — page mentions "quarto" but only as a hyperlink to a co-author's quarto.pub site; the page itself is a Next.js/React build, not Quarto. False positive from a naive grep, caught on inspection.

## Method notes for the coordinator

- **Base rate is low.** Roughly 90+ real, currently-active political-science-adjacent personal sites were checked (department "job market candidates" pages proved the highest-yield source — they reliably link a candidate's own site, unlike graduate-student directories, which almost never link out). Of those, 7 use Quarto (~8%). Jekyll templates (academicpages, al-folio/-folio, Minimal Mistakes) dominate the field overwhelmingly.
- **Where the hits clustered:** Harvard Government (2 of ~17 checked), University of Washington (2 of ~8 checked), plus one each from Rice, NYU, and Marburg (Germany). No hits at all from Yale, UW-Madison (largest batch, ~20 checked), Ohio State, UCLA, Rochester, Duke, Michigan, or Cornell in this sample — those schools appear to run on Jekyll/al-folio almost exclusively.
- **Trust raw HTML over WebFetch summaries for the generator tag.** WebFetch converts pages to markdown and its summarizing pass can hallucinate (see the Jihyeon Bae flag above) or mis-assert framework claims (see the Jacob Winter rejection above). Every quarto/no-quarto call in this file was made by directly grepping curl'd HTML for `generator` and `site_libs`, not by trusting a WebFetch prose summary.
