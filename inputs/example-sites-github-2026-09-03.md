# GitHub-first route — verified Quarto + political-science site candidates

Method: `gh` CLI is **not installed** on this machine, so the GitHub-CLI half of the
brief was skipped as instructed. Everything below instead uses (a) GitHub's
**unauthenticated REST search API** (`api.github.com/search/users` with bio
queries like `"political science" PhD in:bio`, `"assistant professor"
"political science" in:bio`, `"Department of Government" in:bio`, `"PhD
Candidate" "Political Science" in:bio`) to surface real people, then (b) a
small script that hits `https://<user>.github.io/` directly and checks for the
Quarto `<meta name="generator">` tag, then (c) `raw.githubusercontent.com`
fetches of `_quarto.yml` / `index.qmd` / the site's CSS to pull the exact
template/theme/customization facts below. ~450 GitHub usernames were screened
this way. `awesome-quarto` and the `quarto-website`/`academic-website`/
`personal-website` GitHub topics were also checked but turned up no political
scientists (mostly R/stats/biology people and generic templates).

**11 fully verified** (2 PLAIN, 9 LIGHTLY CUSTOMIZED — see note at the end on
why the mix skews customized). All repos are public; all `_quarto.yml`/CSS
facts below were read directly from the repo, not inferred.

---

## Lukas Warode — University of Mannheim (MZES)
- site: https://lwarode.github.io/
- repo: https://github.com/lwarode/lwarode.github.io — `lwarode.github.io` user-pages repo; `output-dir: docs`
- status: "I am a **PhD student in Political Science** at the Mannheim Centre for European Social Research (MZES), University of Mannheim." — quoted from the homepage bio (`index.qmd`, rendered at lwarode.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.6.42">`; `_quarto.yml`: https://raw.githubusercontent.com/lwarode/lwarode.github.io/main/_quarto.yml
- classification: **PLAIN** — `about: template: trestles` (stock); `theme: light: lux` (stock Bootswatch, `dark:` line is commented out/unused); `styles.css` is the default Quarto stub plus one 3-line override (`body { font-family: 'Lato', sans-serif; }`) — essentially untouched; no extensions, no listings/blog (a blog nav item is commented out in the yml); 2 pages (Home, Work/Publications) plus a light/dark toggle icon (built-in Quarto feature, not custom code).
- currency: repo pushed 2025-08-14; `work.qmd` cites 2024–2025 items.
- look, in one line: trestles "about" card — round photo, short welcome paragraph naming his institution/dissertation topic, a row of icon links (email, Twitter/X, GitHub, LinkedIn, CV PDF).
- flags: institution is a research center (MZES) rather than a plain "Department of Political Science," but the site's own words are "PhD student in Political Science."

## Joel Ardiaca — PhD student in Political Science (Survey Methods)
- site: https://joelardiaca.github.io/
- repo: https://github.com/joelardiaca/joelardiaca.github.io — `joelardiaca.github.io` user-pages repo; `output-dir: docs`
- status: "*PhD student in Political Science*" / "*Data Analyst at Centre d'Estudis d'Opinió*" — quoted verbatim from the homepage about block (`index.qmd`, rendered at joelardiaca.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.9.38">`; `_quarto.yml`: https://raw.githubusercontent.com/joelardiaca/joelardiaca.github.io/main/_quarto.yml
- classification: **PLAIN** — `about: template: jolla` (stock); `theme: [cosmo, brand]` — cosmo is stock; the `brand` entry is inert because **no `_brand.yml` exists in the repo** (confirmed 404); `styles.css` is the literal untouched Quarto default (`/* css styles */`, 17 bytes — nothing added); no `_extensions` folder; 4 pages (Home/Research/Blog/CV).
- currency: repo pushed 2026-08-03 (one month ago); `research.qmd` lists a 2026 *West European Politics* article and a conditionally-accepted *Political Science Research and Methods* paper.
- look, in one line: jolla postcard — round photo, two italic self-description lines, a row of small SVG icon links (GitHub/Bluesky/LinkedIn/ORCID/Google Scholar).
- flags: the site never names his PhD-granting university (only his employer, Centre d'Estudis d'Opinió, the Catalan government's opinion-research body); coauthors (Rodon, Guinjoan, Tormos) point at a Catalan university but it's not stated on-site — worth a quick check before featuring if that detail matters.

## Tyler Rongxuan Chen — University of Michigan
- site: https://tylerrongxuanchen.github.io/
- repo: https://github.com/tylerrongxuanchen/tylerrongxuanchen.github.io — user-pages repo; `output-dir: _site`
- status: "Ph.D. Candidate in Political Science & Scientific Computing, University of Michigan" — homepage subtitle (`index.qmd`, rendered at tylerrongxuanchen.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.9.38">`; `_quarto.yml`: https://raw.githubusercontent.com/tylerrongxuanchen/tylerrongxuanchen.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — `about: template: solana` (stock) but `theme: [cosmo, theme.scss]`, where `theme.scss` (1.1KB) is a genuine custom stylesheet: University-of-Michigan brand colors (`#00274C` blue, `#FFCB05` maize accent under the active nav item), a custom font stack, and layout tweaks to the solana template for mobile. 5 nav pages (Home/Research/Data/Teaching/CV).
- currency: repo pushed 2026-09-03 (today).
- look, in one line: solana about page — large rounded photo, name + subtitle, icon-button links (Email/CV/Google Scholar/ORCID/Department Profile), Michigan-blue headings with a maize nav underline.
- flags: none — clean, current, and the "Department Profile" link independently corroborates the affiliation.

## Charlotte Kuberka — LSE (Department of Government)
- site: https://charlottekuberka.github.io/
- repo: https://github.com/charlottekuberka/charlottekuberka.github.io — user-pages repo; no `output-dir` override (default `_site`), built via a committed GitHub Actions workflow (`.github/workflows/quarto-publish.yml`)
- status: "I am a PhD candidate in Political Behavior at the [Department of Government] at LSE." — homepage about text (`index.qmd`, rendered at charlottekuberka.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.8.27">`; `_quarto.yml`: https://raw.githubusercontent.com/charlottekuberka/charlottekuberka.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — `about: template: trestles` (stock), `theme: cosmo` (stock), but `styles.css` (2.2KB) has real, deliberate rules: a custom burgundy/rose palette matched to her CV's LaTeX colors, styled navbar/blockquotes/tables/buttons, and a PDF-embed container for her CV page. 4 pages (Home/Research/Teaching/CV).
- currency: repo pushed 2026-03-05; bio says "Second-year PhD student," consistent with an LSE MRes/PhD start in 2024.
- look, in one line: trestles about page — photo, bio paragraph, an "Education" list (LSE MRes/PhD since 2024, LSE MSc, Humboldt BA/MA), email/GitHub icons, all in a rose/burgundy accent.
- flags: LSE's unit is "Department of Government," not "Department of Political Science" — same field, UK naming convention (also true of Harvard/Cornell/Georgetown).

## Reshi Rajan — Texas A&M University
- site: https://reshi-rajan.github.io/
- repo: https://github.com/reshi-rajan/reshi-rajan.github.io — user-pages repo; `output-dir: docs` (repo also has a stray committed `_site/` alongside `docs/` — build-artifact clutter, not disqualifying)
- status: "Howdy! I am a PhD student in the Department of Political Science at Texas A&M University's Bush School of Government in College Station, Texas." — homepage about text (`index.qmd`, rendered at reshi-rajan.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.9.38">`; `_quarto.yml`: https://raw.githubusercontent.com/reshi-rajan/reshi-rajan.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — `about: template: trestles` (stock) but `theme: hugo-theme-nix` — a non-stock, custom-named theme (not a Bootswatch name) — plus `css: nix.css` (3.8KB, real rules: Texas A&M maroon `#3C0000` navbar, custom body font/size); an `_extensions/` folder is present in the repo. 4 pages (Home/Research/CV/Teaching).
- currency: repo pushed 2026-08-20; footer reads "Copyright © 2026."
- look, in one line: trestles about page — round photo, "Howdy!" bio paragraph, GitHub/Email/Google Scholar links, maroon navbar.
- flags: some repo housekeeping clutter (both `docs/` and a committed `_site/`, a stray `.Rhistory`, a duplicate filename with a trailing space) — cosmetic only; the live site itself is clean.

## Artur Baranov — Northwestern University
- site: https://artur-baranov.github.io/
- repo: https://github.com/artur-baranov/artur-baranov.github.io — user-pages repo; `output-dir: docs`
- status: "I am a PhD Candidate at the Department of Political Science, Northwestern University." — homepage about text (`index.qmd`, rendered at artur-baranov.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.6.39">`; `_quarto.yml`: https://raw.githubusercontent.com/artur-baranov/artur-baranov.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — `about: template: jolla` (stock) but `theme: [flatly, custom.scss]` (custom scss layered on stock flatly), `styles.css` (795 bytes, real rules), `mainfont: roboto`, Font Awesome shortcode icons in the navbar (`{{< fa home >}}` etc.), and a Google Analytics tag. 5 nav items (About/Projects/CV/Contact/Teaching).
- currency: repo pushed 2026-01-20.
- look, in one line: jolla postcard — round photo, bio paragraph on comparative authoritarianism and text analysis, Font-Awesome-icon navbar, LinkedIn/GitHub/email links.
- flags: none major.

## Alex Perdue — Binghamton University
- site: https://alex-perdue.github.io/
- repo: https://github.com/alex-perdue/alex-perdue.github.io — user-pages repo; `output-dir: docs`
- status: "Welcome! I am a PhD Candidate (ABD) in Political Science at Binghamton University." — homepage text (`index.qmd`, rendered at alex-perdue.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.9.35">`; `_quarto.yml`: https://raw.githubusercontent.com/alex-perdue/alex-perdue.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — light/dark theme pair (`flatly`/`darkly`, both stock) but `styles.css` has real custom rules (crimson `#c22222` navbar/links, a self-hosted variable font "Mona Sans" via `@font-face`), a `filters: [fontawesome]` entry plus a CDN Font Awesome stylesheet, and a colored title-block banner. 4 pages (Home/Research/Teaching/**Photography**).
- currency: repo pushed 2026-06-27.
- look, in one line: red title-banner page reading "Welcome," a personal flower photo, an ABD bio paragraph on political violence/white-supremacist-group research, Font-Awesome social icons, and a standalone Photography page.
- flags: the "Photography" nav page is a nice personal touch — a good example of personalizing without breaking the template.

## Haley Daarstad — UC Davis
- site: https://hbdaarstad.github.io/ (redirects to her custom domain, https://haleydaarstad.com)
- repo: https://github.com/hbdaarstad/hbdaarstad.github.io — `hbdaarstad.github.io` user-pages repo with a `CNAME` file to `haleydaarstad.com`; `output-dir: docs`
- status: "My name is Haley and I am a PhD Candidate in the political science department at [The University of California, Davis]." — homepage text (`index.qmd`, rendered at haleydaarstad.com)
- quarto evidence: `_quarto.yml`: https://raw.githubusercontent.com/hbdaarstad/hbdaarstad.github.io/main/_quarto.yml (generator meta confirmed on the final rendered page — a plain non-redirect-following fetch of the bare `.github.io` URL misses it because the domain 301s to the custom domain)
- classification: **LIGHTLY CUSTOMIZED** — no `about:` template at all; a fully hand-built two-column grid layout; `theme: [hd-custom.scss]` — an entirely custom theme file, not layered on a stock base; Google Analytics tag. 4 nav pages (Research/Teaching/Data/Gallery).
- currency: repo pushed 2026-08-26.
- look, in one line: bespoke two-column landing ("hi, hei, hola" heading) — photo left, bio right, button-style Email/CV/GitHub links; a "Gallery" page is an unusual personal addition.
- flags: custom domain, but the repo is still the standard `hbdaarstad.github.io` user-pages repo — fits "published from a GitHub repo" cleanly.

## Frederik Hjorth — University of Copenhagen (FACULTY)
- site: https://fghjorth.github.io/
- repo: https://github.com/fghjorth/fghjorth.github.io — user-pages repo (default branch `master`); `output-dir: _site`
- status: "TT assistant professor at Department of Political Science, University of Copenhagen." (GitHub bio); independently, the homepage footer reads "Frederik Hjorth · University of Copenhagen" (rendered at fghjorth.github.io)
- quarto evidence: `<meta name="generator" content="quarto-1.10.18">`; `_quarto.yml`: https://raw.githubusercontent.com/fghjorth/fghjorth.github.io/master/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED** — `theme: [litera, custom.scss]` (custom scss on stock litera), custom Google Fonts (Cormorant Garamond + Lora), a narrowed content-grid width; 5 separate sections each with their own `index.qmd` (Publications/Working papers/Teaching/Data/Contact) rather than one CV page. A code comment in `_quarto.yml` documents "the 12 conference decks at the repo root" and a superseded `avatar.jpg` kept live for old links — clear evidence of a mature, actively-maintained, multi-year site.
- currency: repo pushed 2026-08-19.
- look, in one line: faculty research site (not an about-card) — portrait, name, and a multi-section navbar rather than a single-page CV.
- flags: **FACULTY, not a student** — useful as the workshop's "what this grows into" example; the most mature/long-running site in this set.

## Alex Newhouse — CU Boulder
- site: https://alexbnewhouse.github.io/
- repo: https://github.com/alexbnewhouse/alexbnewhouse.github.io — user-pages repo; `output-dir: docs`
- status: "PhD Candidate, Political Science · University of Colorado Boulder" — homepage hero kicker (`index.qmd`, rendered at alexbnewhouse.github.io); footer independently reads "Department of Political Science, University of Colorado Boulder"
- quarto evidence: `<meta name="generator" content="quarto-1.8.23">`; `_quarto.yml`: https://raw.githubusercontent.com/alexbnewhouse/alexbnewhouse.github.io/main/_quarto.yml
- classification: **LIGHTLY CUSTOMIZED, heavy end** — no `about:` template; a fully bespoke hero section styled by a 20.7KB custom `styles.css` plus separate light/dark theme `.scss` files; a long footer (Research/Dissertation/Teaching/Tutorials/Code & data/Job market/Talks & press/CV) plus a blog (`posts.html`). Still structurally a Quarto academic site, not a web app — but the most heavily produced example found; borders on the "heavy web-dev production" the brief said to exclude from LIGHTLY CUSTOMIZED, so flagging for the coordinator's judgment.
- currency: repo pushed 2026-08-21; `resources:` includes `prospectus.pdf` (i.e., advanced to candidacy).
- look, in one line: full-bleed hero with large portrait, name, an italic "PhD Candidate" kicker, a one-paragraph research lede, then a long CV-style footer.
- flags: very polished — possibly too advanced as a "here's what you can build in an afternoon" example, but a strong aspirational one; also traces a non-linear path into the PhD (Jan 6th Committee consultant, CTEC deputy director).

## Joe Loffredo — MIT
- site: https://jloffredo2.github.io/
- repo: https://github.com/jloffredo2/jloffredo2.github.io — user-pages repo; `output-dir: _site`; `resources:` list includes a `CNAME` file (custom domain, likely joseph-loffredo.com per his GitHub bio's blog field)
- status: "PhD Candidate, Department of Political Science / Massachusetts Institute of Technology" — homepage footer (`index.qmd`, rendered at jloffredo2.github.io); body text also states "I will be on the job market during the 2026-2027 academic year."
- quarto evidence: `_quarto.yml`: https://raw.githubusercontent.com/jloffredo2/jloffredo2.github.io/main/_quarto.yml (generator meta confirmed on the redirect-followed page; a non-redirecting fetch of the bare `.github.io` URL misses it)
- classification: **LIGHTLY CUSTOMIZED, heavy end** — no `about:` template; a bespoke two-column hero built on a `custom.scss` theme layer, a custom web-fonts include, hand-coded inline SVG social icons (X/Bluesky/GitHub/Scholar/Email), and a small JS snippet for an auto-updating copyright year. Nav: Home/CV/Research/**Job Market Paper**/Data-Code.
- currency: repo pushed 2026-09-03 (today) — as current as it gets.
- look, in one line: two-column hero (bio paragraphs left, portrait right), a bolded "on the job market" callout, "Job Market Paper" as its own nav item.
- flags: MIT, actively on the 2026–27 job market — a timely, high-profile example, but the page will likely change once he places. Similar weight/style to Newhouse's site (both bespoke-hero, no about-template) — the coordinator may want only one of these two "heavy" examples in the final handout, not both.

---

## Rejected / near-miss (don't re-chase)

- **Neomi Rao** (neomi-rao.github.io) — real UChicago political science PhD candidate, real GitHub Pages site — but built with **Jekyll** ("Created with Jekyll Now," `_config.yml`/`_layouts` in the repo), not Quarto. An earlier WebFetch summary incorrectly guessed "appears to be Quarto-based" from the page text alone; direct HTML/repo inspection disproved it. Wrong tool.
- **Phil Henrickson** (phenrickson.github.io) — genuine Quarto site, but he completed his PhD in 2018 and now works at a private consulting firm (AE Business Solutions), not academia. Fails the "current student or faculty" test.
- **Government Methods** (govtmethods.github.io) — genuine Quarto site, but it's a Georgetown student-run group/course initiative page, not one person's personal site.
- **Anton Könneke** (antonknk.github.io, LSE MRes/PhD political science), **Joshua Rodrigues** (joshuaesrodrigues.github.io, Mannheim PhD student), **Clemente T. Sánchez** (clesanbar.github.io, MIT PhD candidate), **Len Metson** (lenmetson.github.io / lenmetson.com, LSE Government PhD student) — all four are real political-science PhD students with **live, working Quarto-generated GitHub Pages sites** (generator meta confirmed by following redirects) and bios that self-identify clearly. But in every case the source repo (`<user>/<user>.github.io`) 404s on the GitHub API — almost certainly a **private repo publishing a public Pages site**, which GitHub allows. That means `_quarto.yml`/theme/template facts can't be read or cited, so they don't meet this task's evidence bar and aren't in the verified list above. Worth a second look if the coordinator has another way to reach the repo contents (e.g., contacting the person directly).

---

## Note on the PLAIN/CUSTOMIZED mix

The brief asked for more PLAIN examples than customized ones. In practice, among
real political-science students/faculty who went to the trouble of standing up a
Quarto site, **true unmodified-defaults sites turned out to be the minority** —
most people who invest the setup time also nudge the CSS or swap a font. Only
Warode and Ardiaca were genuinely untouched (stock about-template + stock theme +
default/near-default CSS); everyone else had at least a deliberate custom
stylesheet. Reporting that honestly rather than stretching borderline cases into
"PLAIN" to hit a ratio.

Output file: `/private/tmp/claude-502/-Users-carlislerainey-Library-CloudStorage-Dropbox-dgs/bf4ec6f2-3a57-4057-8733-e1faf89567ca/scratchpad/verify/examples-github.md`

---

# Re-verification and additions, 2026-09-04

All five chosen repos re-checked (Sonnet agent, curl only): sites 200 with Quarto
generator tags (Baranov 1.6.39 · Joyce 1.9.38 · Chen 1.9.38 · Kuberka 1.8.27 · Hjorth
1.10.18); repos 200 with `_quarto.yml` at root (`main` for all but Hjorth, `master`).
Joyce's repo `marandaljoyce/marandaljoyce.github.io` confirmed via the GitHub API.

## Frederick Solt — University of Iowa (FACULTY; "grow into" example)
- site: https://fsolt.org/ — sitemap 179 `<loc>`; nav: SWIID · DCPO · Research · Teaching · Software · Blog · CV
- repo: https://github.com/fsolt/fsolt.github.io — default branch `master`; `_quarto.yml` on `master` (main → 404); public; last push 2026-04-08
- status: "I am a professor in the Department of Political Science at the University of Iowa." — homepage
- quarto evidence: `<meta name="generator" content="quarto-1.7.32">`
- hosting: `fsolt.github.io` → 301 with `server: GitHub.com` → fsolt.org, which answers `server: cloudflare` (Cloudflare-proxied custom domain over GitHub Pages)

## Rob Hyndman — Monash University (FACULTY; "grow into" example)
- site: https://robjhyndman.com/ — sitemap 881 `<loc>`; nav: Hyndsight blog · Publications · Software · Seminars · Teaching · Research Team · About · Subscribe
- repo: https://github.com/robjhyndman/robjhyndman.com — default branch `main`; public; last push 2026-08-31
- quarto evidence: `<meta name="generator" content="quarto-1.10.18">`
- hosting: 🔴 `server: nginx` — self-hosted, NOT GitHub Pages (the repo carries an `.htaccess`). Included at Carlisle's request; the guide bullet says so.

## Chad Hazlett — UCLA (FACULTY; "grow into" example, added later 2026-09-04)
- site: https://chadhazlett.com/ — sitemap 8 `<loc>`; nav: Home · Research · Publications · Teaching · Software · CV
- repo: https://github.com/chadhazlett/chadhazlett.github.io — `_quarto.yml` on `main`; public
- status: "Professor of Political Science and Statistics, UCLA" — homepage
- quarto evidence: `<meta name="generator" content="quarto-1.10.18">`; hosting `server: GitHub.com`

## Christopher T. Kenny — Princeton (POSTDOC; "grow into" example, added later 2026-09-04)
- site: https://christophertkenny.com/ — sitemap 18 `<loc>`; nav: Research · Teaching · Software · CV · Quarto · Blog
- repo: https://github.com/christopherkenny/christopherkenny.github.io — `_quarto.yml` on `main`; public (GitHub username lacks the T)
- status: "Postdoctoral Research Associate, Data-Driven Social Science, Princeton University" — homepage
- quarto evidence: `<meta name="generator" content="quarto-1.10.18">`; hosting `server: GitHub.com`
