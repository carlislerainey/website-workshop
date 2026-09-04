# Link verification — "Build Your First Academic Website" workshop handout

Verified 2026-09-03. Every URL below was fetched live (WebFetch) or confirmed via
multiple current (2026) search results where direct fetch was blocked by bot
protection (noted case by case). Audience: ~15 poli-sci PhD students, comfortable
with R, new to Quarto, zero web-dev background, building RStudio + GitHub Desktop +
render-to-`docs/` + GitHub Pages sites in a 90-minute session.

**Total IN: 25** (of 29 evaluated). 4 rejected outright (dead domain, stale/workflow
mismatch, redundant chapter, doesn't fit no-commentary format). This runs a bit over
the ~22 target — see the note at the end of Part 1 for what's most cuttable if the
handout needs to shrink further.

---

## Part 1 — vetted links

### Prerequisites (8 IN, 2 OUT)

1. **`https://github.com/signup`**
   What: GitHub account creation form.
   Verdict: **IN** — the literal first step; nothing else works without it. (Direct
   WebFetch got a 403 — GitHub's bot-protection blocks non-browser fetches on this
   page specifically — but GitHub's own docs page "Creating an account on GitHub"
   currently links here as the canonical signup URL, confirmed via search.)
   Belongs: prerequisites

2. **`https://happygitwithr.com/github-acct`**
   What: Happy Git with R, Ch. 4 "Register a GitHub account" — username advice before
   you commit to one.
   Verdict: **IN** — genuinely good, specific advice (see Part 2 for the tips
   themselves) that a generic "create an account" page won't give you, and choosing
   badly here creates cleanup work later (this workshop's own username-change doc,
   evaluated below, exists because of exactly this).
   Belongs: prerequisites

3. **`https://happygitwithr.com/install-r-rstudio`**
   What: Happy Git with R, Ch. 5 "Install or upgrade R and RStudio."
   Verdict: **OUT** — redundant. It just re-links `cloud.r-project.org` and
   `posit.co/download/rstudio-desktop` (already a separate candidate below) plus
   commentary on upgrade cadence. Given the audience is already "comfortable with R"
   (i.e., already has it installed), and the guide links with no commentary, this
   chapter's one distinctive value-add — the upgrade-philosophy paragraph — can't
   travel through a bare link anyway.
   Belongs: n/a

4. **`https://desktop.github.com/`**
   What: GitHub Desktop client download page.
   Verdict: **IN** — required tool, no substitute.
   (Note: WebFetch's crawler gets redirected to `github.com/apps/desktop`, which I
   checked directly — it's the same "GitHub Desktop" client landing page, not an
   unrelated GitHub App listing. GitHub's own "Installing GitHub Desktop" doc
   currently links `desktop.github.com` as the download destination. Bot-detection
   artifact, not a real problem.)
   Belongs: prerequisites

5. **`https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/authenticating-to-github-in-github-desktop`**
   What: GitHub Docs — signing into GitHub Desktop (browser-based OAuth flow, 2FA).
   Verdict: **IN** — this is a self-service prerequisite done at home before the
   session with no instructor present; the "it opened my browser, now what?" moment
   is a real first-time stuck point worth pre-empting.
   Belongs: prerequisites

6. **`https://posit.co/download/rstudio-desktop/`**
   What: Posit's RStudio Desktop download page.
   Verdict: **IN** — cheap safety-net link even though most students likely already
   have RStudio. (It currently 301-redirects to `docs.posit.co/ide/user/...`, which I
   confirmed is a live, current page — version 2026.08.2, published 2026-08-27, with
   direct Windows/Mac/Linux installers. The old marketing URL still resolves
   correctly; just noting it redirects.)
   Belongs: prerequisites

7. **`https://orcid.org/register`**
   What: ORCID iD registration.
   Verdict: **IN** — needed for the About page's ORCID button. (Page is a JS-rendered
   SPA that WebFetch's markdown conversion couldn't extract text from, but it loads
   correctly — this is an extremely stable, long-standing canonical URL.)
   Belongs: prerequisites

8. **`https://scholar.google.com/intl/en/scholar/citations.html`**
   What: Google Scholar's own page on creating/claiming a Scholar profile.
   Verdict: **IN** — needed for the About page's Scholar button. No dedicated
   `support.google.com` page exists for this (checked); Scholar's own site is the
   authoritative source and confirmed current.
   Belongs: prerequisites

9. **`https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-user-account/managing-user-account-settings/changing-your-github-username`**
   What: GitHub Docs — how to change your username, and what breaks (old profile
   links 404, gists get new URLs, mobile app lag).
   Verdict: **OUT** — real and current, but doesn't fit a no-commentary inline link.
   Dropped bare into a prerequisites list, a student would reasonably wonder "wait,
   am I supposed to do this?" without a sentence of framing. Better handled as
   something the instructor mentions verbally to the one or two students who need it,
   not a link everyone sees.
   Belongs: n/a

### Build steps (7 IN)

10. **`https://quarto.org/docs/websites/`**
    What: Quarto's website-building overview (project setup, `_quarto.yml`, render
    targets, navigation).
    Verdict: **IN** — the right first stop once RStudio is open.
    Belongs: RStudio step

11. **`https://quarto.org/docs/publishing/github-pages.html`**
    What: Quarto's GitHub Pages publishing guide — specifically documents the
    render-to-`docs/` approach: *"The simplest way to publish using GitHub Pages is
    to render to the `docs` directory and then check that directory into your
    repository,"* with `output-dir: docs` and a `.nojekyll` file.
    Verdict: **IN** — matches this workshop's exact workflow, not the
    `quarto publish`/GitHub Actions alternatives.
    Belongs: publish step

12. **`https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site`**
    What: GitHub Docs — the actual Settings → Pages screen: "Deploy from a branch,"
    branch dropdown, then a folder dropdown for `/(root)` vs `/docs`.
    Verdict: **IN** — **this is a gap-fill, not one of the original candidates.**
    Nothing in the original list actually covered the GitHub-side "turn Pages on and
    point it at `/docs`" step — Quarto's doc covers the render side, this covers the
    repo-settings side. Confirmed current and exact-match for this workflow.
    Belongs: Pages step

13. **`https://quarto.org/docs/websites/website-about.html`**
    What: Quarto's About-page doc — 5 templates (jolla, trestles, solana, marquee,
    broadside), image options, and the `links:` field (icon + href + text) used for
    Email/CV/Scholar/ORCID buttons.
    Verdict: **IN** — directly describes the `jolla` layout this workshop's starter
    site uses.
    Belongs: layout section

14. **`https://icons.getbootstrap.com/`**
    What: Searchable Bootstrap Icons gallery (v1.13.1, 2,000+ icons) — where the
    `icon:` names in About-page links come from.
    Verdict: **IN** — useful if a student wants an icon beyond what the starter
    template already ships with (e.g., a personal blog, Mastodon/Bluesky, LinkedIn).
    Belongs: layout section

15. **`https://quarto.org/docs/output-formats/html-themes.html`**
    What: Quarto's HTML theming doc — confirms Quarto ships all 25 Bootswatch themes
    by name via the `theme:` option, plus Sass customization.
    Verdict: **IN** — this is the doc that explains *how* to apply a Bootswatch name.
    Belongs: theme section

16. **`https://bootswatch.com/`**
    What: Visual gallery of the 25 Bootswatch themes (cosmo, darkly, flatly, etc.),
    live and current, tuned for Bootstrap 5.3.8.
    Verdict: **IN** — this is where you actually *look* at themes before picking one.
    Belongs: theme section

### Google-indexing extension (4 IN)

17. **`https://search.google.com/search-console/about`**
    What: Search Console's landing page — "Start now" buttons that begin the
    add-a-property flow.
    Verdict: **IN** — correct entry point.
    Belongs: Google-indexing extension

18. **`https://support.google.com/webmasters/answer/9008080`**
    What: Search Console help — site-ownership verification methods.
    Verdict: **IN** — see Part 2 for the exact method list and HTML-file
    requirements.
    Belongs: Google-indexing extension

19. **`https://support.google.com/webmasters/answer/7451001`**
    What: Search Console help — submitting a sitemap.
    Verdict: **IN** — exact 6-step flow confirmed current.
    Belongs: Google-indexing extension

20. **`https://quarto.org/docs/websites/website-tools.html`**
    What: Quarto's own site-metadata doc — setting `site-url:` in `_quarto.yml`.
    Verdict: **IN** — **another gap-fill.** Community sources (a quarto-dev GitHub
    discussion, and independent blog posts by tarleb.com and Rogue Scholar)
    consistently confirm that Quarto auto-generates `sitemap.xml` *only if*
    `site-url` is set — there is no sitemap to submit to Search Console without this
    step. Quarto's own docs page documents `site-url` and confirms Quarto
    auto-copies a `robots.txt` if present, but — I want to flag this honestly — does
    **not** itself explicitly document the sitemap-generation behavior; that detail
    is corroborated by community sources, not spelled out on quarto.org. I'm
    including it anyway because it's the one link that explains why GSC would find
    anything to index in the first place, and it's more relevant to *this* audience
    (building a Quarto site specifically) than the generic Google pages.
    Belongs: Google-indexing extension

### Analytics extension (1 IN)

21. **`https://support.google.com/analytics/answer/9304153`**
    What: "Set up Analytics for a website and/or app" — GA4 property-creation
    click path (Admin → Create → Property...) through the Measurement ID.
    Verdict: **IN** — confirmed current (2026 copyright, no supersession notice).
    Note: a second URL, `support.google.com/analytics/answer/14183469`, carries the
    same title and near-identical content and is also live — I checked both and
    they're redundant with each other, so only one belongs in the handout. I picked
    9304153 as the more established, more widely-cross-referenced ID.
    Belongs: Analytics extension

### Custom-domain extension (4 IN)

22. **`https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site`**
    What: GitHub's own custom-domain doc — A records, CNAME, HTTPS enforcement.
    Verdict: **IN** — primary source; see Part 2 for the exact records and timings.
    Belongs: custom-domain extension

23. **`https://www.namecheap.com/support/knowledgebase/article.aspx/9645/2208/how-do-i-link-my-domain-to-github-pages/`**
    What: Namecheap's own guide to pointing a Namecheap domain at GitHub Pages.
    Verdict: **IN** — its DNS records (4 A records + www CNAME) match GitHub's
    current docs exactly, confirmed side by side. Last updated 9/23/2024 — the IPs
    it lists have not changed since, despite one AI summarizer pass incorrectly
    flagging them as stale (I independently re-verified them against GitHub's own
    live docs; they match).
    Belongs: custom-domain extension

24. **`https://www.namecheap.com/domains/`**
    What: Namecheap's domain search/registration landing page.
    Verdict: **IN** — where a student would actually search and buy a name.
    (Direct WebFetch was blocked with a 403 — Namecheap's bot protection, same
    pattern as GitHub's signup page — but this is an extremely well-established,
    actively-used commercial URL, corroborated by numerous current 2026
    pricing-comparison sources that cite it directly.) "Beast Mode" (bulk/creative
    domain search) still exists in 2026 per Namecheap's own materials, but it's built
    for checking hundreds/thousands of names at once — overkill for one student
    picking one personal domain, so I'm not listing it as a separate link.
    Belongs: custom-domain extension

25. **`https://instantdomainsearch.com/`**
    What: Real-time, no-signup domain availability search across 800+ extensions,
    with name suggestions.
    Verdict: **IN** — confirmed live, free, no account required — a genuinely better
    fit than Beast Mode for "is my-name-here.com free?"
    Belongs: custom-domain extension

    *(Evaluated but not included as a separate link: GitHub's "Troubleshooting custom
    domains" doc. It has two genuinely useful facts — a static-site rebuild can
    silently overwrite/delete your `CNAME` file, and HTTPS can take up to an hour to
    activate after DNS resolves — both folded into Part 2 below. But as a bare
    second GitHub-custom-domain link with no commentary, right next to the main
    "managing a custom domain" doc, it would just be confusing about which to click
    first. Its content is captured as facts, not as a duplicate click target.)*

### Further reading (2 IN, 2 OUT)

26. **`https://ucsb-meds.github.io/creating-quarto-websites/`**
    What: "Creating your personal website using Quarto" — UCSB Master of
    Environmental Data Science program (Sam Csik).
    Verdict: **IN — pick #1.** Published Aug 2022, **modified Aug 14, 2026** —
    actively maintained, not a one-and-done post. Covers the same stack we're
    teaching (RStudio + GitHub Pages from `/docs`) in more depth: Bootswatch theme
    swaps, multi-page navbars, landing-page template choices, and links onward to
    sibling workshops on Sass/CSS customization and adding a blog. Built for the same
    kind of audience (quantitative grad students, not web developers), which is the
    strongest fit of any candidate.
    What it adds beyond our session: deeper theme/navbar customization, a clear next
    step into blogging.
    Belongs: further-reading

27. **`https://albert-rapp.de/posts/13_quarto_blog_writing_guide/13_quarto_blog_writing_guide.html`**
    What: "The ultimate guide to starting a Quarto blog" — Albert Rapp.
    Verdict: **IN — pick #2.** Published July 2022, updated July 2023. Starts from
    scratch (assumes only that Quarto is installed) but is explicitly blog-focused:
    RSS feeds, comments, a newsletter, custom footers, package pinning with
    `{renv}`. Our starter site (home/Research/Teaching/CV) deliberately has no blog,
    so this fills a real, named gap for "students who want more depth or a blog," per
    the brief. The author is self-aware about scope ("notice that this is a lot")
    and even points beginners toward simpler resources first — appropriate framing
    for an optional extension link, not a required step.
    What it adds beyond our session: a full blog setup, which we don't cover at all.
    Belongs: further-reading

28. **`https://marvinschmitt.com/blog/website-tutorial-quarto/`** (and `www.` variant)
    What: "Create Your Website with Quarto: Complete Tutorial and Template."
    Verdict: **OUT — domain is dead.** Both the bare and `www.` hosts fail: `www.`
    doesn't resolve (DNS `ENOTFOUND`) and the bare domain serves a hosting-provider
    domain-suspension notice ("Sorry, Please confirm that this domain name has been
    bound to your website"), not the tutorial. This was a well-regarded, frequently
    cross-linked resource as recently as searches suggest, but it is not currently
    live — do not include.
    Belongs: n/a

29. **`https://beamilz.com/posts/2022-06-05-creating-a-blog-with-quarto/en/`**
    What: "Creating a blog with Quarto in 10 steps" — Beatriz Milz.
    Verdict: **OUT.** Published June 2022 and reads dated (it introduces Quarto as
    "a new software," describes GitHub Discussions setup, and deploys via
    **Netlify**, not GitHub Pages) — a workflow mismatch that would actively confuse
    students following our `docs/` + GitHub Pages instructions. Albert Rapp's guide
    (above) covers the same "add a blog" ground, is equally example-driven, and
    doesn't fight our deployment method.
    Belongs: n/a

### If this needs to shrink further

Most cuttable, in order, without losing anything category-unique: (a) `icons.getbootstrap.com`
(#14 — nice-to-have, the starter template already ships with icons chosen), (b) the
Happy Git username-tips chapter (#2 — nice but not load-bearing if the guide already
states 2-3 tips inline), (c) GitHub Desktop's authenticating doc (#5). Do not cut
anything from Google-indexing, Analytics, or custom-domain — those extensions only
have one link per fact they support.

---

## Part 2 — facts for the extensions

### Custom domain: A records and CNAME
Source: [GitHub Docs — Managing a custom domain for your GitHub Pages site](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)

> 185.199.108.153
> 185.199.109.153
> 185.199.110.153
> 185.199.111.153

**www CNAME target:** `<user>.github.io` (i.e., a `www` CNAME record points at your
plain `username.github.io` address, not at the apex domain).

Cross-checked against [Namecheap's own GitHub Pages guide](https://www.namecheap.com/support/knowledgebase/article.aspx/9645/2208/how-do-i-link-my-domain-to-github-pages/),
last updated 9/23/2024 — identical four IPs, identical CNAME instruction. **Both
sources agree; the four IPs are current as of 2026-09-03.**

### Where the CNAME file lives, and what GitHub does when you type a domain into Pages settings
Source (primary): GitHub's managing-custom-domain doc — *"If you are publishing your
site from a branch, this will create a commit that adds a CNAME file directly to the
root of your source branch."* The [troubleshooting doc](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages)
uses the more precise phrase *"a CNAME file in the root of your publishing source."*

**What this means for a `/docs`-on-`main` site (our workflow):** GitHub's own term
for "which branch + folder is being served" is "publishing source" — so when the
publishing source is set to `/docs`, the root of that publishing source is `/docs`
itself, **not the true top level of the repo.** In other words: typing a domain into
the Pages settings box writes (or updates) **`docs/CNAME`**, not `/CNAME` at the repo
root. This reading is corroborated by independent community write-ups discussing
exactly this `/docs`-branch scenario (a tarleb.com post and a `quarto-dev`/`mkdocs`
GitHub discussion both state the CNAME must sit inside the publishing folder). I'd
call this well-supported but not 100%-primary-source-explicit — GitHub's docs never
spell out the `/docs` case in so many words, they only define "publishing source"
elsewhere and let the reader connect it. Flag this for a live check if it's going in
front of students as a hard claim.

**Practical gotcha (from the troubleshooting doc):** re-rendering and force-pushing
your site (which is exactly what `quarto render` + a fresh push does) **can silently
overwrite or delete the CNAME file** GitHub created. Their advice: *"make sure to
pull the commit that added the CNAME file to your local repository first"* before
your next render/push — otherwise the custom domain silently breaks on the next
deploy.

### Enforce HTTPS — waits and conditions
Two separate waits, from two different GitHub doc pages:
- The "Enforce HTTPS" checkbox itself: *"It can take up to 24 hours before this
  option is available"* after configuring the custom domain (managing-custom-domain
  doc).
- Once you've enabled it: *"It can take up to an hour for your site to become
  available over HTTPS after you configure your custom domain"* (troubleshooting
  doc) — this second wait is for the certificate itself to issue.
- Also noted: pointing a `www` subdomain at your apex domain (rather than the four A
  records) causes problems enforcing HTTPS.

### DNS propagation time
GitHub's own docs: *"DNS changes can take up to 24 hours to propagate."* I did not
find a distinct, differing propagation-time figure stated on Namecheap's own GitHub
Pages guide — it gives the DNS records but doesn't itself commit to a propagation
window, so GitHub's "24 hours" is the number to quote.

### Search Console verification methods (URL-prefix property)
Source: [Verify your site ownership](https://support.google.com/webmasters/answer/9008080)
and [Add a property](https://support.google.com/webmasters/answer/34592).

For a **URL-prefix** property specifically, methods available: **HTML file upload,
HTML meta tag, Google Analytics tracking code, Google Tag Manager.** (DNS/"domain
name provider" verification is the method tied to the separate **Domain**-type
property, not URL-prefix — the two property types and their verification options are
explicitly distinct in Google's docs.)

**HTML-file method, exact requirement:** upload the provided file to your site's
**root directory**, unmodified — *"do not otherwise modify the file name or
content"* — such that Google can browse it directly (e.g.
`https://example.com/<google-provided-filename>.html`) **without login**, then click
Verify.

### GSC sitemap submission — exact steps
Source: [Sitemaps report help](https://support.google.com/webmasters/answer/7451001)
1. Post the sitemap on your site (standard location: site root, e.g.
   `https://example.com/sitemap.xml`).
2. Spot-check it's reachable with the URL Inspection tool.
3. Open the Sitemaps report in Search Console.
4. Paste the sitemap URL into "Add a new sitemap."
5. Click Submit.

For a Quarto site: **Quarto only generates `sitemap.xml` automatically if `site-url:`
is set** in `_quarto.yml` — without it, there's nothing to submit. This isn't
spelled out explicitly on quarto.org's own `website-tools.html` page (which
documents `site-url` for other reasons and documents automatic `robots.txt`
handling) — it's corroborated by a `quarto-dev` GitHub discussion and independent
posts (tarleb.com, Rogue Scholar), not a single clean primary-source sentence.

### GA4 property-creation click path and Measurement ID
Source: [Set up Analytics for a website and/or app](https://support.google.com/analytics/answer/9304153)
(confirmed current, 2026 copyright; near-duplicate content also live at
`answer/14183469`).

**Click path:** Admin → (Property column) **Create** → **Property** → enter name /
timezone / currency → Next → industry category + business size → Next → business
objective → **Create** → accept Terms of Service → **Data Streams** → **Add stream**
→ **Web** → enter site URL + stream name → (optionally) enable enhanced measurement
→ **Create stream**.

**Measurement ID:** Admin → **Data Streams** → click your web data stream → under
"Stream Details" → **Measurement ID** (format `G-XXXXXXX`). Google notes data
collection can take **up to 30 minutes** to start appearing after the ID is added to
a site.

### Namecheap .com pricing and WHOIS privacy
I could not fetch namecheap.com's own pricing pages directly (403 — bot-blocked for
this tool, both `/domains/` and `/domains/domain-name-search/`), so this is drawn
from several independent 2026 pricing-comparison sources rather than one primary
page — treat as genuinely ballpark, and sanity-check at checkout before quoting a
number to students:

- **First year:** roughly **$7–$11** for a `.com` (promotional pricing fluctuates;
  one August 2026 source quotes $6.79, another quotes $10.98).
- **Renewal:** roughly **$15–$18/year** — a real step up from the first-year promo
  price, which is standard registrar practice, not a Namecheap-specific gotcha.
- **WHOIS privacy:** free, included for the life of the domain at Namecheap (this
  point was consistent across every source checked and is a genuine differentiator
  worth mentioning — some registrars charge extra for this).

### Happy Git with R — username advice, condensed
Source: [Register a GitHub account](https://happygitwithr.com/github-acct)

- *"Incorporate your actual name! People like to know who they're dealing with."*
- *"Pick a username you will be comfortable revealing to your future boss."*
- *"Shorter is better than longer... Be as unique as possible in as few characters
  as possible."*
- *"Make it timeless. Don't highlight your current university, employer, or place
  of residence."*
- (bonus/5th, worth keeping if room allows) *"We highly recommend all lowercase"*
  — use a hyphen, not case-switching, to separate words.
