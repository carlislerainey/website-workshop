# Verified facts — "Build Your First Academic Website" guide

Quarto versions used:
- QCLI (`quarto` on PATH): **1.6.42**
- QRS (RStudio-bundled, `/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto`): **1.9.38**

All renders and screenshots use QRS except Task 1's QCLI side, per instructions.

---

## Task 1 — skeleton parity (QCLI vs QRS)

Command (both binaries, separate dirs): `quarto create project website skel --no-open --no-prompt`

- **Result: IDENTICAL.** `diff -r qcli/skel qrs/skel` produced no output (exit 0) — the two skeletons are byte-for-byte identical.
- Files created (both binaries): `_quarto.yml`, `index.qmd`, `about.qmd`, `styles.css` — matches the guide's claim exactly.
- Exact `_quarto.yml` content (identical from both binaries):

  ```yaml
  project:
    type: website

  website:
    title: "skel"
    navbar:
      left:
        - href: index.qmd
          text: Home
        - about.qmd

  format:
    html:
      theme:
        - cosmo
        - brand
      css: styles.css
      toc: true
  ```

  Confirms every guide claim: navbar Home/About, `theme: [cosmo, brand]`, `css: styles.css`, `toc: true`.
- `index.qmd`: `title: "skel"` + two lines of Quarto boilerplate text.
- `about.qmd`: `title: "About"` + "About this site".
- `styles.css`: single comment line `/* css styles */`.

**Verdict: guide's parity/skeleton-contents claims are all correct.**

---

## Task 2 — render the skeleton and screenshot it

Mid-task correction applied: the guide's placeholder convention is `USERNAME.github.io`, and the skeleton's navbar/H1 title is taken from the project directory name passed to `create`. Re-created the skeleton with QRS using that literal directory name:

`quarto create project website USERNAME.github.io --no-open --no-prompt` (run inside `skeleton/`)

- Console: `WARN: No 'title' for project provided ... Using 'USERNAME.github.io' as default.`
- `_quarto.yml` → `title: "USERNAME.github.io"` (confirmed).
- Rendered with QRS (`quarto render .`): `[1/2] index.qmd`, `[2/2] about.qmd`, `Output created: _site/index.html`, exit 0.
- Screenshot → `shots/skeleton-home.png` (2560×1600 @2x, 68 KB). Visually confirmed: both the navbar brand and the H1 read "USERNAME.github.io".

*(The Task 1 parity dirs were left named `skel` — only Task 2's screenshot dir needed the rename, per the coordinator's note.)*

---

## Task 3 — build the base site and variant screenshots

Copied from `SIMPLE` into `$WORK/site/`: `_quarto.yml`, `index.qmd`, `research.qmd`, `teaching.qmd`, `cv.pdf`, `headshot.jpg`, `.nojekyll` (docs/, README.md, preview.png, .gitignore excluded, as instructed).

Rendered with QRS: `[1/3] teaching.qmd`, `[2/3] research.qmd`, `[3/3] index.qmd`, `Output created: docs/index.html`, exit 0.

Confirmed claims:
- `docs/` created — yes (fresh directory, did not exist before this render).
- `docs/cv.pdf` exists — yes, 132101 bytes, byte-identical to source.
- `docs/headshot.jpg` exists — yes, 117383 bytes, byte-identical to source.
- `docs/.nojekyll` exists **and is copied in from the project root** — yes. Root `site/.nojekyll` (0 bytes) existed before the render; `docs/.nojekyll` (0 bytes) appeared in the newly created `docs/` directory after the render. Since `docs/` did not exist beforehand and nothing else could have put a `.nojekyll` there, this confirms the root file is what gets copied.

### Screenshots produced (all confirmed non-blank; sizes below)

1. `shots/home-jolla.png` — base site, template `jolla`, theme `cosmo`.
2. `shots/home-trestles.png` — `index.qmd` `template: jolla` → `template: trestles`.
3. `shots/home-solana.png` — `template: solana`. Reverted to `jolla` afterward.
4. `shots/research-page.png` — `docs/research.html`, base site (title: "Research").
5. Theme series (`_quarto.yml` `theme: cosmo` edited, template held at `jolla`): `shots/theme-flatly.png`, `shots/theme-sandstone.png`, `shots/theme-litera.png`, `shots/theme-zephyr.png`, `shots/theme-sketchy.png`, `shots/theme-vapor.png`. Reverted to `cosmo` afterward.

All @2x (2560×1600) shots are well under the ~1.2 MB caution threshold — largest is `theme-vapor.png` at 603 KB.

**End-of-task revert check:** `diff` against the original `SIMPLE` sources for `_quarto.yml`, `index.qmd`, `research.qmd`, `teaching.qmd` — all four produced empty diffs (byte-identical). Site left in clean base state (template `jolla`, theme `cosmo`) before Task 4.

---

## Task 4 — one-line claims, verified on the base site (QRS)

⚠️ **CORRECTED 2026-09-03 (fact-check, agent A2):** the "general pattern" originally stated here was too broad and has been falsified — an unlinked root `completely-unlinked.pdf`/`.txt`/`.jpg` is **not** copied. The real rule: Quarto copies files that pages **link to or reference** (`cv.pdf`, `headshot.jpg` via `image:`), plus the two special names **`.nojekyll` and `CNAME`**. Original (wrong) sentence kept for the record: **Quarto's website-project build auto-copies any non-source file sitting in the project root into the output dir on every render, with no `resources:` declaration needed** — this is why `cv.pdf`, `headshot.jpg`, `.nojekyll`, and (below) a plain `CNAME` file all show up in `docs/` untouched. The one exception found is `.html` files specifically (see f) — those are silently skipped by the default copy and need an explicit `resources:` entry.

### a. PDF copying — CONFIRMED TRUE
- `cp cv.pdf working-paper.pdf`; added `[Download the PDF](working-paper.pdf)` to `research.qmd` body.
- After render: `docs/working-paper.pdf` exists, 132101 bytes, byte-identical to source.
- Reverted (deleted line + file); re-render confirmed absence.

### b. Sitemap + Open Graph — CONFIRMED TRUE
- Added under `website:` (same indent as `title:`):
  ```yaml
  site-url: https://johnasmith.github.io
  open-graph: true
  ```
- `docs/sitemap.xml` created (476 bytes). First 5 lines:
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
      <loc>https://johnasmith.github.io/index.html</loc>
      <lastmod>2026-09-03T10:39:22.420Z</lastmod>
  ```
- `docs/index.html` gained (lines 74–77):
  ```html
  <meta property="og:title" content="Your Name">
  <meta property="og:description" content="">
  <meta property="og:image" content="https://johnasmith.github.io/headshot.jpg">
  <meta property="og:site_name" content="Your Name">
  ```
- Reverted; re-render confirmed both gone (see finding under (c) about how cleanly this happened).

### c. Google Analytics — CONFIRMED TRUE
- Added under `website:`: `google-analytics: "G-TESTTEST12"`
- `docs/index.html` head gained:
  ```html
  <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-TESTTEST12"></script>
  ...
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-TESTTEST12', { 'anonymize_ip': true});
  ```
- **Incidental finding:** this render also silently removed the orphaned `docs/sitemap.xml` left over from test (b) (config for it had already been reverted) — the first sign that `quarto render` prunes previously-generated files that the current config no longer produces. Sharpened into a direct test in (e1) below.
- Reverted; re-render confirmed gtag snippet gone.

### d. Page description — CONFIRMED TRUE
- Added `description: A short description of this page.` to `index.qmd` front matter (top level, under `title:`).
- `docs/index.html` line 9: `<meta name="description" content="A short description of this page.">`
- Reverted; confirmed gone (grep count 0).

### e. CNAME survival — tested e1 and e2; **e3 not needed, e2 already worked**
- Established a clean baseline render first (no leftover meta tags; `docs/` = `.nojekyll`, `cv.pdf`, `headshot.jpg`, `index.html`, `research.html`, `search.json`, `site_libs/`, `teaching.html`).
- **e1 — hand-placed file directly in the OUTPUT dir:** wrote `johnasmith.com` into `docs/CNAME`, then ran `quarto render .` again (no source-tree change). **Result: `docs/CNAME` is GONE after the render.** Quarto rebuilds/cleans the output directory and does not preserve a file that isn't part of what it generates from the source tree.
- **e2 — file at the PROJECT ROOT, no `resources:` declaration:** wrote `johnasmith.com` into `CNAME` next to `_quarto.yml`. Rendered. **Result: `docs/CNAME` EXISTS**, content `johnasmith.com` (14 bytes, matches source exactly). Re-ran a second consecutive render with no changes — `docs/CNAME` persisted identically both times, so this isn't a one-render fluke.
- **e3 — SKIPPED.** Not needed: e2 already succeeds with a plain, undeclared root file (consistent with the auto-copy behavior also seen for `cv.pdf`/`headshot.jpg`/`.nojekyll`).
- **Recipe the guide should teach:** put a file literally named `CNAME` (no extension), containing just the domain, in the **project root** next to `_quarto.yml` — the same place as `cv.pdf`/`headshot.jpg`. Do **not** hand-edit `docs/CNAME` directly; it will be deleted on the next render.
- Reverted (removed root `CNAME`); re-render confirmed `docs/CNAME` gone again.

### f. Google Search Console HTML-file verification — SURPRISING result, two-part
- Created `google1234567890abcdef.html` at the project root, content exactly: `google-site-verification: google1234567890abcdef.html` (53 bytes).
- Rendered. **Result: `docs/google1234567890abcdef.html` DOES NOT EXIST** — not copied verbatim, not wrapped/rendered into the site template either. The render step's file list only ever named the three `.qmd` files ([1/3]/[2/3]/[3/3]); the `.html` file was silently skipped. The source file itself was left completely untouched at the project root (still present, unchanged, 53 bytes).
- This **contradicts** the naive expectation set by CNAME's behavior (e2) that "any file at the project root gets auto-copied" — `.html` specifically is excluded from that default.
- **Supplementary test** (beyond the literal question, run because the guide needs a working recipe for this very common case): declared it explicitly —
  ```yaml
  project:
    type: website
    output-dir: docs
    resources:
      - google1234567890abcdef.html
  ```
  Re-rendered. **Result: `docs/google1234567890abcdef.html` NOW EXISTS**, content verbatim/byte-identical to the source (`google-site-verification: google1234567890abcdef.html`, 53 bytes) — not wrapped, not touched.
- **Recipe:** unlike CNAME, a GSC verification `.html` file needs an explicit `resources:` entry under `project:` in `_quarto.yml`. A bare drop-in at the root is not enough.
- Reverted (removed the `resources:` entry and the root file); re-render confirmed clean `docs/`.

### g. Headshot alt text — CONFIRMED TRUE, and a real accessibility gap
- **Baseline** (base site, no edits), `docs/index.html` line 123:
  ```html
  <img src="headshot.jpg" class="about-image
    round " style="height: 15em; width: 15em;">
  ```
  **No `alt` attribute at all** — not present, not empty (`alt=""`), simply absent from the tag.
- Added `image-alt: "Your Name"` to `index.qmd` front matter, top level, next to `image:`. Rendered.
- `docs/index.html` line 123 now: `<img src="headshot.jpg" alt="Your Name" class="about-image ...`
- Reverted; confirmed the `alt` attribute is gone again in the baseline.

### h. Icons — CONFIRMED TRUE both ways
- QRS's `bootstrap-icons.css` located at:
  `/Applications/RStudio.app/Contents/Resources/app/quarto/share/formats/html/bootstrap/dist/bootstrap-icons.css`
  (Bootstrap Icons **v1.13.1**; file contains 2081 `::before` icon rules total, confirming it's fully populated and the negative result below isn't a truncated-file artifact.)
- `.bi-orcid::before` → **NOT FOUND** (grep exit 1; zero case-insensitive hits for "orcid" anywhere in the file). Confirms: no ORCID icon in the set.
- `.bi-bluesky::before` → **FOUND**: `.bi-bluesky::before { content: "\f7f9"; }`. Confirms: a bluesky icon exists in QRS 1.9.38's icon set.

---

## Task 5 — placeholder images

Generated with a small Python script (`gen_placeholders.py`) writing 6 standalone HTML files: `#d9d9d9` light-gray background, dashed gray border, bold `#222` centered text at 44px, flexbox-centered with a 1000px max-width wrapper so long labels wrap cleanly. Screenshotted with Chrome headless at `--window-size=1280,800` **without** a device-scale-factor override, so each PNG is exactly 1280×800 px (unlike the @2x site screenshots in Tasks 2–3).

- All 6 confirmed **exactly 1280×800 px** via `sips`.
- Two spot-checked visually (`pages-settings.png`, and `rstudio-wizard.png` — the longest label): both render cleanly, centered, no clipping or overflow. *(`rstudio-wizard.png` was subsequently cut from the guide — dropped 2026-09-03, see note below.)*
- Sizes run 27–38 KB each — naturally smaller than the real rendered-page screenshots because they're flat-color graphics with minimal detail; the "> 30 KB is a decent non-blank proxy" rule from Task 3 doesn't map onto these directly, hence the visual spot-check instead.

Files: `shots/placeholders/rstudio-wizard.png`, `rstudio-render-button.png`, `github-desktop-changes.png`, `github-desktop-publish.png`, `pages-settings.png`, `live-site.png`. *(`rstudio-wizard.png` and `live-site.png` were dropped from the guide 2026-09-03 as low-value relative to hand-shoot cost — see note below. The other four remain live.)*

---

## All PNGs produced

| File | Size (KB) | Dimensions |
|---|---:|---|
| shots/skeleton-home.png | 68 | 2560×1600 |
| shots/home-jolla.png | 367 | 2560×1600 |
| shots/home-trestles.png | 571 | 2560×1600 |
| shots/home-solana.png | 417 | 2560×1600 |
| shots/research-page.png | 207 | 2560×1600 |
| shots/theme-flatly.png | 370 | 2560×1600 |
| shots/theme-sandstone.png | 368 | 2560×1600 |
| shots/theme-litera.png | 431 | 2560×1600 |
| shots/theme-zephyr.png | 374 | 2560×1600 |
| shots/theme-sketchy.png | 417 | 2560×1600 |
| shots/theme-vapor.png | 603 | 2560×1600 |
| shots/placeholders/rstudio-wizard.png | 38 | 1280×800 |
| shots/placeholders/rstudio-render-button.png | 28 | 1280×800 |
| shots/placeholders/github-desktop-changes.png | 29 | 1280×800 |
| shots/placeholders/github-desktop-publish.png | 31 | 1280×800 |
| shots/placeholders/pages-settings.png | 27 | 1280×800 |
| shots/placeholders/live-site.png | 27 | 1280×800 |

17 PNGs total.

*(**2026-09-03, superseding note:** `rstudio-wizard.png` and `live-site.png` were cut from
the guide the same day — the wizard fields are already spelled out step by step in the
guide's prose right where the image sat, so the screenshot was redundant recognition, not
new comprehension, and the live-site shot was purely celebratory, duplicated
`home-jolla.png` shown earlier, and was the most expensive of the six to stage. Their
placeholder files and the rows above are kept as the historical record of what was
generated and verified; they are no longer needed and are not referenced by `guide.qmd`.
The guide now embeds 15 PNGs — 11 auto-generated plus 4 manual — and `shot-list.md` covers
only the remaining four.)*
