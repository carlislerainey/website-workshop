# Fact-check of `web/` — 2026-09-03 (evening, after Carlisle's rewrite)

Seven Sonnet agents, each owning one domain of claims, all read-only on the project,
each rendering only in a scratch copy. Everything below was verified by an agent that
saw the evidence itself (a rendered file, a fetched page, a command's output, an image
opened) — nothing is graded from memory. The seven per-agent reports (with the exact
commands, URLs, and quotes) are in the session scratchpad; this file keeps what matters.

**Bottom line: no ERRORs.** Nothing in `guide.qmd` would make a student's step fail.
Every instruction that could be render-tested was, with the students' own Quarto
(RStudio's bundled 1.9.38), and held. What the sweep found is (a) about a dozen
IMPRECISE or STALE sentences in the guide, two of which affect the room's clock;
(b) a handful of things a student could hit that the guide doesn't mention; and
(c) eleven stale numbers in the two CLAUDE.md files, which drifted behind the evening
rewrite.

## What was checked, by agent

| # | Domain | Method | Result |
|---|---|---|---|
| A1 | Default Quarto skeleton, the RStudio wizard, "five things we changed", `.nojekyll`, RStudio menu labels | `quarto create` with 1.5.57 · 1.6.42 · 1.7.32 · 1.9.38; RStudio's own UI strings; Rscript; YAML tab test | 3 IMPRECISE, rest OK |
| A2 | Layouts, themes, icons, linked-file copying, CNAME, sitemap, open-graph, analytics, `image-alt`, `_brand.yml` | Rendered scratch `simple/` with 1.9.38 (CLI spot-checked); screenshots of all 5 templates + 6 themes; quarto.org, bootswatch.com | 0 ERROR; 1 IMPRECISE in the guide, 1 in our notes |
| A3 | GitHub, GitHub Desktop, GitHub Pages, custom domain (GitHub side) | Live docs.github.com pages, quoted; `.nojekyll` render test; local git defaults | 2 IMPRECISE, rest OK; 5 gaps |
| A4 | Namecheap, Domainr, prices, DNS records | Namecheap KB articles; domainr.com; Rscript; GitHub docs source | 1 STALE (unconfirmed), rest OK; 4 gaps |
| A5 | Every URL in guide, slides, index, `_quarto.yml`, `simple/` | Fetched all 22 real URLs + 7 placeholders; compared to `link-vetting-2026-09-03.md` | 1 STALE, 2 IMPRECISE, 20 OK |
| A6 | The five example sites | Raw HTML (`generator`, `quarto-about-*` class), each public repo, department pages | 3 IMPRECISE, rest OK |
| A7 | Internal consistency, screenshots, slides, template, README, CLAUDE.md files, fresh render vs `docs/` | Ran all four checks; opened all 15 PNGs; rendered both projects in scratch and diffed | Guide/slides/template clean; 3 IMPRECISE; 8 STALE in CLAUDE.md |

## Findings in the guide, ranked

Two affect the workshop clock; the rest are wording.

1. **"Wait about two minutes, then visit…" and "These updates will appear on your live
   site about two minutes later."** *(Turn on GitHub Pages · Updating your site)* —
   GitHub's own page says *"It can take up to 10 minutes for changes to your site to
   publish."* A student who waits two minutes and sees nothing will think it's broken,
   and the guide's *Live by 3:30* rests on this line. Suggest: "Wait a few minutes
   (GitHub says up to ten)." **[IMPRECISE, matters in the room]**

2. **"The box can take a while to become clickable, and the certificate can take up to an
   hour after that."** *(Extension)* — GitHub: *"It can take up to 24 hours before this
   option [Enforce HTTPS] is available,"* and after saving, the certificate should appear
   within *"several minutes"* — if it hasn't, remove the domain and re-add it. No "up to
   an hour" exists in current docs; the two-stage timing is inverted. **[IMPRECISE]**

3. **The "change it" link for renaming a GitHub username** *(Before the workshop)* now
   301-redirects to GitHub's *concepts* page (what happens when you rename), not the
   how-to. The how-to moved to
   `https://docs.github.com/en/account-and-profile/how-tos/account-management/changing-your-username`.
   Also: `link-vetting-2026-09-03.md` had marked this link OUT; it is in the guide anyway.
   **[STALE]**

4. **"In the Files pane (bottom right) you will find four files"** *(Render the site)* —
   `quarto create` does make exactly those four, but RStudio's wizard also writes
   `USERNAME.github.io.Rproj`, which is not a dotfile and so is visible. A student
   counting will see five. Suggest a fifth row ("RStudio's project file — leave it
   alone") or drop the count. **[IMPRECISE]**

5. **`styles.css` "An empty file for custom styling" / "The file is empty"** — the default
   holds one line, `/* css styles */` (17 bytes), in every Quarto version tested. True in
   spirit; a student who opens it sees text. **[IMPRECISE, minor]**

6. **"Below are five sites … using a process similar to the one described in this
   guide."** *(Examples)* — only Baranov and Joyce commit a `docs/` folder. Chen deploys
   with `quarto publish gh-pages` (a `gh-pages` branch, `output-dir: _site`); Kuberka and
   Hjorth deploy with GitHub Actions workflows. Suggest "made with Quarto and GitHub
   Pages" and drop the clause. **[IMPRECISE]**

7. **"These three are pretty close to what you'll have"** — only Joyce is (stock `darkly`
   plus the untouched 17-byte `styles.css`). Baranov has a `custom.scss` (palette, Roboto,
   pill buttons, Font Awesome nav icons, Analytics); Chen has a `theme.scss` (Michigan
   blue/maize, Source Sans 3, a mobile override). Both still use the named template, so
   the layout claims are right. Suggest "started from the same templates you will."
   **[IMPRECISE]**

8. **"Frederik Hjorth, a professor at Copenhagen"** — Copenhagen's own profile page says
   *Associate Professor*; his GitHub bio still says assistant professor. "A professor"
   is colloquially fine; "an associate professor" is exact. **[IMPRECISE, minor]**

9. **"POS 5736: Political Science Research Methods I (graduate)"** *(teaching.qmd sample;
   also in `simple/`)* — the FSU bulletin and `fall26sch.csv` title POS 5736 **"Research
   Design."** POS 2041 "American National Government" is correct. Students copy this
   line. Changing it means editing `simple/teaching.qmd`, re-pasting the block, and
   re-shooting nothing (the research page is the one screenshotted). **[IMPRECISE]**

10. **`# All website options: https://quarto.org/docs/websites/website-navigation.html`**
    *(the `_quarto.yml` block, and `simple/_quarto.yml`)* — that page covers navbars and
    sidebars only. The three keys the comment sits under (`site-url`, `open-graph`,
    `google-analytics`) are documented at `website-tools.html`, and the full reference is
    already linked three lines up. Suggest repointing or deleting the line. This also
    lives in the template bound for the public repo. **[IMPRECISE]**

11. **Namecheap prices** — "about $10 the first year and about $15 a year after" is
    probably low now: 2026-dated aggregators show $10.98–11.48 first year and
    $18.48–18.68 renewal, and Namecheap's blog announced a `.com` increase. Namecheap's
    own pricing page is Cloudflare-403 to tools, so **check in a browser**. Also "WHOIS
    protection" is now branded "Domain Privacy" (still free, auto-added). **[STALE,
    unconfirmed]**

12. **Placeholder DOI `10.1086/000000`** resolves to a real *Modern Philology* issue page
    (10.1086 is Chicago's prefix, not JOP's). The other placeholders all 404, and the
    all-zero ORCID fails its checksum. Cosmetic. **[IMPRECISE]**

13. Three cosmetic ones, Carlisle's call: **"you will move it to a new location in the
    next section"** (nothing is moved — `_site` is deleted and `docs/` rendered fresh);
    **sandstone alt text "warm gray tones"** (Quarto's sandstone navbar is Bootstrap's
    cool `#343A40`, not Bootswatch's warm gray — "muted gray" is exact); **"`toc: true` is
    deleted, because a table of contents on a webpage is usually clutter"** (true, but a
    TOC never appears on the about-template home page — it would show on research and
    teaching, which have headings).

Confirmed OK and worth knowing it was checked: the five-things diff is exact and
complete, with the default `_quarto.yml` byte-identical across 1.6.42 and 1.9.38
(`theme: [cosmo, brand]` + `toc: true` exist from Quarto 1.6 on, i.e. every 2025+
RStudio, so "any version since 2025" holds); every RStudio label in the guide matches
RStudio's own UI strings, including "Quarto Website" as a distinct wizard entry;
"RStudio → About RStudio" is the right place to read the RStudio version the sentence
is about; tabs make YAML fail hard; all five about-template descriptions match rendered
screenshots; "25 themes" is exactly right (Quarto lists 26 incl. its own `default`;
Bootswatch lists 25 + `brite`, which Quarto lacks); the six theme descriptions match;
every icon named exists in both bundled sets except `bluesky` (1.13.1 only), and there
is no `orcid` icon anywhere, including on the live icon site (also 1.13.1 today);
`site-url` → `sitemap.xml`, `open-graph: true` → `og:image` from the `image:` field,
`google-analytics` → gtag, all at the indent the comments say; a bare `- research.qmd`
navbar entry takes the page title (proved by renaming it); `image-alt` → a real `alt`;
`[cosmo, brand]` with no `_brand.yml` renders with zero warnings; a root `.nojekyll`
and a root `CNAME` are both copied into `docs/` every render, GitHub needs them
*there* (in the publishing source), and a copy placed directly in `docs/` dies on the
next render, so the guide's Console recipe is the right one; the four A records match
GitHub's list in the same order; `/` and `/docs` are the only folder choices; free
plan = public repos only; "Commit to main" vs `master` caveat is justified (git's
compiled default is still `master`; this Mac gets `main` from Xcode's config); the
"Keep this code private" wording is exact; the old `USERNAME.github.io` address
**redirects** to the custom domain (`carlislerainey.github.io` → 301 →
carlislerainey.com), so "keeps working" is true; the Namecheap KB article resolves
with no redirect and lists exactly the guide's five records; the default parking
records are exactly the two the guide says to delete; Domainr refers and does not
sell; `writeLines` writes `johnasmith.com\n` and GitHub strips the newline; all five
example sites are live, Quarto-built (generator tags 1.6.39–1.10.18), on the named
template (`quarto-about-jolla` etc. in the HTML), and their people are who the guide
says at the institutions it names — nobody has placed, though **Joyce is on the
2026–27 market; re-check her before the session**; Kuberka's `styles.css` literally
says "Custom color theme based on your LaTeX colors"; Chen's buttons are Email, CV,
Scholar, ORCID, GitHub; Hjorth has Papers, Teaching, Data. JOP 88 = 2026 and
*Political Analysis* 33 = 2025. All 15 screenshots match their captions, alt text, and
the current bio; the four gray placeholders are shot-list's four. The committed `docs/`
and `simple/docs/` are both current with their sources (fresh renders diffed);
nothing from `simple/`, `inputs/`, or `tools/` leaks into `docs/`; every `img`/`href`
in `docs/guide.html` resolves; `cv.pdf` is byte-identical to the CV template preview;
check-slides 38/227/0 and check-blocks 4/4 identical; the ten time goals are monotonic
and match CLAUDE.md.

## Gaps — things a student could hit that the guide doesn't mention

Not errors. Whether any belongs in the handout is a judgment call; the first two are
the likeliest to bite in the room.

- **Mandatory two-factor authentication.** A fresh GitHub signup can be forced through
  2FA enrollment; the "Before the workshop" checklist says nothing.
- **Verified email.** Pages publishes only from a push by an account with a verified
  email; an unverified account fails silently.
- **GitHub Desktop's Publish dialog has an "Organization" dropdown** — a student with an
  org from another class could publish to the wrong owner (choose None).
- GitHub Desktop may **warn about git name/email** before the first commit.
- **Namecheap's records only take effect on BasicDNS** (the default for a fresh domain);
  the KB says so, the guide doesn't. Namecheap-side propagation is 24–48 h, which is
  *why* GitHub's check "can take up to a day."
- GitHub docs now also list four optional **AAAA** records; not needed.
- Windows menu wording for GitHub Desktop ("File → Options → Accounts") could not be
  captured from the docs' OS tab; the Mac path is exact.

## Stale bookkeeping in the CLAUDE.md files (fixed 2026-09-03 after this check)

All eleven were true before Carlisle's evening rewrite of `guide.qmd` (mtime 20:41);
both CLAUDE.md files were last edited at 16:13. None is in the guide.

| Claim | Reality |
|---|---|
| "16-section" (`web/CLAUDE.md`); "20-section … now 16" (root) | **17** numbered sections |
| "37-slide" (both) | **38** (`check-slides.py`, and `grep -c '^## ' slides.qmd`) |
| "13 of 16 sections in band; §5 and §16 semicolons, §10 we/contractions" | **12 of 15**; the three flagged are semicolons in "Render the site", "Publish", "Extension"; nothing flagged for we/contractions |
| "section 3 sits just outside the band (long_words=13)" | §3 is now `ok` |
| "site-url points at a page that does not exist yet"; "Publishing the repo" under Not yet | **The site is live**: https://www.carlislerainey.com/website-workshop/ (200, generator quarto-1.6.42) |
| "27 distinct URLs" (`web/`); "25 vetted inline links" (root) | ~34 distinct; six never vetted (see A5) |
| "17 screenshots … 6 placeholders" (root) | 15 / 4 (`web/CLAUDE.md` is right) |
| Tracked-files list | also `previews/` and root `styles.css` |
| "Quarto auto-copies any non-source file in the project root" (`web/CLAUDE.md`, `verified-facts`) | **False.** Only *linked* files, plus the two special names `.nojekyll` and `CNAME`. An unlinked `.pdf`/`.txt`/`.jpg` is not copied. The guide's own wording ("files your pages link to") is the correct one. |
| `shot-list.md`: "re-render the guide (`quarto render guide.qmd`)" | contradicts `web/CLAUDE.md`'s "never `quarto render guide.qmd` alone"; render the project |
| root: "three render-verified extensions" | one (Namecheap); the other two were cut |

## Not checked

A real end-to-end run on a clean machine (the RStudio wizard click-through, GitHub
Desktop Publish, the Pages settings page, a live custom-domain purchase). Every claim
about those was checked against the vendor's current documentation and UI strings,
not by driving the GUI. That dry run is still the item in `CLAUDE.md`'s "Not yet."
