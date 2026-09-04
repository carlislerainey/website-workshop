# The tutorial corpus, measured 2026-08-29

The evidence behind [`../guide-style.md`](../guide-style.md). Fifteen published
tutorials, **43,068 words of prose**, fetched 2026-08-29, converted with pandoc,
then stripped to prose: navigation, headers, footers, sidebars, code blocks, and
tables removed, and lines under four words dropped, so the rates describe
sentences a reader actually reads.

**Rates are per 10,000 words.** ⚠️ **The `contr` column was recomputed 2026-08-29 after section-testing found the first version counted possessives** (`project's`, `Quarto's`) as contractions, inflating both sides. It now matches `'ll 't 're 've 'd 'm` plus a closed list for `'s`. The corpus median fell 89 → 82 and the guide's 36 → 13, so **the real gap is wider than first reported.** `img/1k` is images per 1,000 words, counted in
the page's main region before stripping.

| # | tutorial | words | sent | you | we | contr | emdash | semi | img/1k |
|---|---|---|---|---|---|---|---|---|---|
| 1 | [Csik, *Creating your personal website using Quarto* (R-Ladies SB)](https://samanthacsik.github.io/RLadiesSB-quarto-websites/) | 6337 | 22.6 | 638 | 96 | 158 | 0 | 0 | 5.2 |
| 2 | [UCSB MEDS, *Creating Quarto websites*](https://ucsb-meds.github.io/creating-quarto-websites/) | 12153 | 25.8 | 541 | 112 | 143 | 0 | 4 | 4.8 |
| 3 | [Schmitt, *Create Your Website with Quarto*](https://marvin-schmitt.com/blog/website-tutorial-quarto/) | 3233 | 21.5 | 612 | 90 | 120 | 0 | 12 | 2.8 |
| 4 | [Rapp, *The ultimate guide to starting a Quarto blog*](https://albert-rapp.de/posts/13_quarto_blog_writing_guide/13_quarto_blog_writing_guide.html) | 6098 | 14.0 | 626 | 84 | 187 | 0 | 0 | 2.1 |
| 5 | [Milz, *Creating a blog with Quarto*](https://beamilz.com/posts/2022-06-05-creating-a-blog-with-quarto/en/) | 2544 | 20.3 | 562 | 28 | 39 | 4 | 0 | 10.6 |
| 6 | [Kim, *Build a blog with Quarto, Git, and RStudio*](https://brisbane-geocommunity.netlify.app/posts/2022-11-03-build-blog-w-quarto/) | 2823 | 15.5 | 347 | 142 | 82 | 4 | 0 | 5.7 |
| 7 | [L3 Lab, *From Git to GitHub using RStudio*](https://l3lab.net/posts/tutorial-quarto-blog/2024-07-23-from-git-to-github-using-rstudio/) | 1386 | 23.5 | 79 | 7 | 0 | 14 | 0 | 4.3 |
| 8 | [Quarto, *Tutorial: Hello, Quarto*](https://quarto.org/docs/get-started/hello/rstudio.html) | 1122 | 26.1 | 267 | 53 | 45 | 27 | 0 | 14.3 |
| 9 | [Quarto, *Creating a Website*](https://quarto.org/docs/websites/) | 1352 | 23.3 | 340 | 15 | 44 | 0 | 0 | 17.8 |
| 10 | [Quarto, *GitHub Pages*](https://quarto.org/docs/publishing/github-pages.html) | 1914 | 25.2 | 674 | 26 | 93 | 21 | 0 | 1.0 |
| 11 | [Bryan, *Happy Git with R* — existing project, GitHub first](https://happygitwithr.com/existing-github-first.html) | 1101 | 19.3 | 500 | 73 | 136 | 0 | 0 | 1.8 |
| 12 | [GitHub Docs, *GitHub Pages quickstart*](https://docs.github.com/en/pages/quickstart) | 562 | 13.1 | 623 | 0 | 93 | 0 | 0 | 7.1 |
| 13 | [GitHub Docs, *Creating a GitHub Pages site*](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site) | 1217 | 17.1 | 748 | 8 | 93 | 0 | 0 | 3.3 |
| 14 | [Openscapes, *Making shareable documents with Quarto*](https://openscapes.github.io/quarto-website-tutorial/) | 587 | 22.6 | 341 | 187 | 187 | 17 | 17 | 0.0 |
| 15 | [He, *Quarto Academic Website Examples and Tips*](https://drganghe.github.io/quarto-academic-site-examples.html) | 639 | 16.4 | 360 | 0 | 47 | 0 | 16 | 3.1 |
| | **median** | | **21.5** | **541** | **53** | **82** | **0** | **0** | **4.3** |
| | **`guide.md`, 2026-08-29 draft** | 1371 | 23.6 | 408 | **0** | **13** | **190** | **29** | **0** |

## Two structural counts

- **"Step N" headings: 0 of 203 headings, across all fifteen.** Sequence lives in
  numbered lists — Csik has 41 `<ol>`s, UCSB MEDS 69 — while headings name the
  thing being accomplished ("Build & publish your site with GitHub Pages",
  "Update your landing page"). Headings break down as **68% noun phrase, 18%
  imperative, 7% gerund, 7% question**. *(The classifier undercounts imperatives —
  it missed "Initialize your blog" — so read 18% as a floor.)*
- **Screenshots are constant: median 4.3 images per 1,000 words**, and every
  tutorial has some. `guide.md` has none.

## Notes on the measurement

- ⚠️ **Two corrections were needed mid-analysis, and both changed the answer.**
  (1) The contraction count first used a straight apostrophe only; these pages use
  curly ones almost exclusively (UCSB MEDS: 242 curly to 16 straight), so the first
  pass reported **zero contractions for nearly every tutorial** — the opposite of
  the truth. (2) `hahoangnhan.github.io`'s tutorial turned out to be a **verbatim
  repost of Schmitt's** — identical cleaned prose, 3,233 words both — and was
  dropped so it would not count twice.
- The imperative-opener rate is **not** in the table. It was measured (corpus
  median 7%, `guide.md` 29%) but is not trustworthy: instructions in the corpus sit
  inside numbered list items, and enough of them survive conversion with their
  numbering attached to defeat a sentence-initial-verb match. **The reliable form of
  that finding is the structural one above** — the corpus puts instructions in
  lists — not the percentage.
- Rebuild: the fetch-and-measure scripts were one-offs in the session scratchpad.
  [`../tools/prose-rates.py`](../tools/prose-rates.py) is the part worth keeping; it
  measures a markdown file against the medians above.
