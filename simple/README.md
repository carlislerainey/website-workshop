# An academic website in Quarto

A starter website for a political science graduate student: a home page with a photo
and a short bio, a research page, a teaching page, and a link to a PDF of your CV.
Built with [Quarto](https://quarto.org) and published, free, on GitHub Pages.

It uses Quarto's default theme (`cosmo`) and the centered `jolla` home-page layout.
The comments in `_quarto.yml` and `index.qmd` say what every setting is for, suggest a
few things to try, and link to the complete list of options.

![The home page](preview.png)

## What is here

| File | What it is |
|---|---|
| `_quarto.yml` | The site's settings: title, navbar, theme. |
| `index.qmd` | The home page: photo, bio, and the row of links. |
| `research.qmd` | The research page. |
| `teaching.qmd` | The teaching page. |
| `cv.pdf` | Your CV. Replace the file; keep the name. |
| `headshot.jpg` | Your photo. Replace the file; keep the name. |
| `styles.css` | Empty, and loaded on every page. Put your own CSS rules here if a theme setting is ever not enough. |
| `docs/` | The rendered site. Quarto writes it and GitHub Pages serves it. Never edit it by hand. |
| `.nojekyll` | Tells GitHub Pages to serve `docs/` exactly as written. Leave it alone. |


## Make it yours

1. Install [Quarto](https://quarto.org/docs/get-started/). RStudio, VS Code, and
   Positron all know how to preview and render Quarto files; any text editor works too.
2. Replace the sample content: your name in `_quarto.yml` and `index.qmd`; your bio,
   papers, and courses; the email, Google Scholar, and ORCID links; `headshot.jpg`
   and `cv.pdf`.
3. Look at it as you go: open a terminal in this folder and run `quarto preview`.

## Publish on GitHub Pages

1. On GitHub, create a repository named `USERNAME.github.io`, where `USERNAME` is your
   GitHub username. That exact name is what makes the site live at
   `https://USERNAME.github.io`.
2. In this folder, run `quarto render`. It writes the finished site into `docs/`.
3. Commit everything — including `docs/` — and push it to that repository.
4. On GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a branch**,
   then choose branch `main` and folder `/docs`, and save.
5. Give it a minute, then visit `https://USERNAME.github.io`.

To update the site later: edit, `quarto render`, commit, push. Nothing else.

## Change the look

Three settings do almost all of the work, and each is one line.

- **Theme** — `theme:` in `_quarto.yml`. Quarto ships 25
  [Bootswatch](https://bootswatch.com) themes; the list with pictures is at
  <https://quarto.org/docs/output-formats/html-themes.html>. Change the word, re-render.
- **Home-page layout** — `template:` in `index.qmd`: `jolla` (centered), `trestles`
  (photo left), or `solana` (photo right). Pictures at
  <https://quarto.org/docs/websites/website-about.html>.
- **Photo shape** — add `image-shape: round` (or `rectangle`, `rounded`) under
  `about:` in `index.qmd`.

Two more things you will want eventually:

- **Another page.** Create `talks.qmd` with a `title:` line at the top, and add
  `- talks.qmd` to the navbar list in `_quarto.yml`.
- **A PDF** (a syllabus, a working paper). Put the file in this folder and link to it —
  `[Syllabus](pos2041-syllabus.pdf)`. Quarto copies every linked file into `docs/`.

The icons on the home-page buttons are [Bootstrap Icons](https://icons.getbootstrap.com/);
`github`, `linkedin`, `mastodon`, and `twitter-x` are there if you want them.
