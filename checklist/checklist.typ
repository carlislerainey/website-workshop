// checklist.typ
//
// One-page, black-and-white, print-ready checklist for the "Build Your First
// Academic Website" workshop. Students follow the HTML guide on screen
// (https://www.carlislerainey.com/website-workshop/guide.html) and tick boxes
// here to track progress; this sheet holds ONLY section/step/substep labels,
// never the how-to detail, which stays in guide.qmd.
//
// KEEP IN STEP WITH guide.qmd. If a section, numbered step, or wall-clock
// time goal in ../guide.qmd changes, update this file to match. Section
// numbers here are the guide's own Quarto section numbers (number-sections:
// true), not a renumbering, so students can cross-reference the screen.
//
// Build:  typst compile checklist.typ checklist.pdf
// Fonts:  Lora (body) + Montserrat (headings) -- both confirmed installed
//         via `fc-list` on this machine (2026-09-04).

#set page(
  paper: "us-letter",
  margin: (x: 0.5in, y: 0.5in),
)
#set text(font: "Lora", size: 10.5pt, fill: black)
#set par(leading: 5pt, spacing: 5pt, justify: false)

// ---- helpers -----------------------------------------------------------

// A hand-drawn checkbox + hanging-indented item text.
#let item(body) = {
  grid(
    columns: (9.5pt, 1fr),
    column-gutter: 5.5pt,
    box(width: 9pt, height: 9pt, stroke: 0.6pt, baseline: 0.5pt),
    text(size: 10.1pt, body),
  )
  v(4pt, weak: true)
}

// A section heading: guide section number + title, with an optional
// wall-clock time goal right-aligned on the same line, then a rule.
#let section(number, title, time: none) = {
  v(12pt, weak: true)
  text(font: "Montserrat", weight: "bold", size: 11.5pt)[#number. #title]
  v(2.5pt, weak: true)
  if time != none {
    grid(
      columns: (1fr, auto),
      column-gutter: 6pt,
      align: (left + horizon, right + horizon),
      line(length: 100%, stroke: 0.7pt),
      text(font: "Montserrat", weight: "medium", size: 8.5pt, style: "italic")[#time],
    )
  } else {
    line(length: 100%, stroke: 0.7pt)
  }
  v(4.5pt, weak: true)
}

// A small unnumbered sub-note under an item (e.g. "optional").
#let note(body) = {
  text(size: 8.4pt, style: "italic", fill: luma(40%))[#body]
  v(2pt, weak: true)
}

// ---- header --------------------------------------------------------------

#text(font: "Montserrat", weight: "bold", size: 19pt)[Build Your First Academic Website]
#v(2pt)
#text(font: "Montserrat", size: 10pt, style: "italic")[Workshop checklist. The details are in the guide:]
#v(1pt)
#text(font: "Montserrat", size: 10pt)[https://www.carlislerainey.com/website-workshop/guide.html]

#v(7pt)
#line(length: 100%, stroke: 1.1pt)
#v(3pt)

// ---- two-column body -------------------------------------------------

#let left-col = [
  #section("3", "Before the workshop", time: "before 2:00")
  #item[GitHub account (github.com/signup) -- pick your username carefully]
  #item[GitHub Desktop installed and signed in]
  #item[R and RStudio installed (latest version)]
  #item[A professional headshot, cropped square]
  #item[Your CV as a PDF]
  #item[An ORCID iD (orcid.org/register)]
  #item[Google Scholar profile URL]
  #note[skip if you don't have a profile yet]

  #section("5", "Make the project in RStudio", time: "Done by 2:15")
  #item[File -> New Project -> New Directory -> Quarto Website]
  #item[Directory name: `USERNAME.github.io`, all lowercase]
  #item[Check "Create a git repository"]
  #item[Click Create Project]

  #section("6", "Render the site Quarto gave you", time: "Done by 2:20")
  #item[Build tab -> click Render Website]

  #section("7", "Point your site at the docs folder", time: "Done by 2:30")
  #item[Open `_quarto.yml`, select all, delete, paste in the new block]
  #item[Delete the `_site` folder]

  #section("8", "Build your three pages", time: "Done by 2:50")
  #item[Delete `about.qmd`]
  #item[Edit `index.qmd`: paste home-page block; fill in your info]
  #item[New Text File -> paste research block -> Save As `research.qmd`]
  #item[New Text File -> paste teaching block -> Save As `teaching.qmd`]

  #section("9", "Add your photo and your CV", time: "Done by 2:55")
  #item[Copy your headshot and CV into the project folder]
  #item[Rename them `headshot.jpg` and `cv.pdf`]

  #section("10", "Add a .nojekyll file")
  #item[In the Console, run `file.create(".nojekyll")`]
]

#let right-col = [
  #section("11", "Check your site before you publish", time: "Done by 3:00")
  #item[Build -> Render Website]
  #item[Open the site in a browser; click through Home, Research, Teaching, CV]
  #item[Fix anything broken]

  #section("12", "Rearrange your home page", time: "Done by 3:05")
  #item[Change `template: jolla` to `trestles`; save; render]
  #item[Try `template: solana`]
  #item[Keep the layout you like]

  #section("13", "Pick a theme", time: "Done by 3:10")
  #item[Change `theme: cosmo` to `flatly`; save; render]
  #item[Try `sandstone`, `litera`, `zephyr`]
  #item[Try `sketchy` or `vapor`, then pick your favorite]

  #section("14", "Publish your site with GitHub Desktop", time: "Done by 3:20")
  #item[Add local repository -> select your project folder]
  #item[Leave all changes checked]
  #item[Summary: "Initial commit" -> Commit to main]
  #item[Uncheck "Keep this code private" -> Publish repository]

  #section("15", "Turn on GitHub Pages", time: "Live by 3:30")
  #item[On github.com: Settings -> Pages]
  #item[Source: Deploy from a branch]
  #item[Branch `main` (or `master`), folder `/docs` -> Save]
  #item[Wait a few minutes; visit your live site]

  #section("16", "Updating your site")
  #item[Edit the `.qmd` file; save]
  #item[Build -> Render Website]
  #item[GitHub Desktop: summary -> Commit to main -> Push origin]
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 22pt,
  left-col,
  right-col,
)
