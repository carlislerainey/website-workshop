$-- template.typ -- pandoc typst template for domains.md -> domains.pdf.
$-- Invoked by the Makefile:
$--   pandoc -s -t typst --template=template.typ domains.md -o domains.typ
$--   typst compile domains.typ
$-- Copied from ../../../work-2026-2027/website-review/tools/template.typ, which
$-- came from ../../../informal-handbook/template.typ. Owns all styling:
$--   - Lora 11pt body, Montserrat headings, US Letter, 1in margins.
$--   - Black and white only: body text and headings are black except the two
$--     named grays below (##3 headings, subtitle, footer) -- no other color.
$--   - ## -> heading level 2 (14pt bold black), ### -> level 3 (12pt bold,
$--     dark gray #434343). Title/subtitle come from the .md's YAML front
$--     matter (title 20pt bold Montserrat, subtitle 12pt gray #666666).
$--   - Footer: "TITLE -- n / N" centered, falling back to "n / N" when the
$--     document has no title.
$--   - Links render as plain black underlined text (no blue), and both links
$--     and inline code (backticked text) get zero-width-space break points
$--     after "/", "-", "_", "." etc. so long URLs and IPv6 addresses wrap
$--     inside table cells and prose instead of overflowing the page.
$--   - Fenced code blocks (the curl/dig/writeLines recipes) render in a
$--     monospace face at 9pt with a light rule at the left, no background.
$--   - Tables (pandoc emits plain #table(...) calls, not #figure) get a
$--     single thin rule under the header row, left-aligned 10pt text, and a
$--     show rule that rebuilds them with fractional column widths so long
$--     cell content wraps to the page instead of stretching it.

#let body-font = ("Lora", "Apple Symbols")
#let heading-font = "Montserrat"
#let dark-gray = rgb("#434343")
#let mid-gray = rgb("#666666")
#let zw = "\u{200B}"

$-- Insert a zero-width space after common URL/path punctuation so long,
$-- unbroken tokens (URLs) get break opportunities instead of overflowing
$-- their column or the page margin.
#let breakable(s) = s.replace(regex("([/\-_.,;:?=&~%])"), m => m.text + zw)

#set page(
  paper: "us-letter",
  margin: 1in,
  numbering: none,
  footer: context {
    set text(font: body-font, size: 9pt, fill: dark-gray)
    set align(center)
    let n = counter(page).get().first()
    let total = counter(page).final().first()
$if(title)$
    [$title$ -- #n / #total]
$else$
    [#n / #total]
$endif$
  },
)

#set text(font: body-font, size: 11pt, fill: black)
#set par(justify: false)
#set heading(numbering: none)
#show heading: set text(font: heading-font, fill: black)
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 3): set text(size: 12pt, weight: "bold", fill: dark-gray)
#show heading.where(level: 4): set text(size: 12pt, weight: "bold", fill: dark-gray)

$-- Inline code: backticked URLs and criterion numbers. Monospace, ~9.5pt,
$-- black, no background box -- and breakable, since this is where the
$-- reviewer agent is expected to put every URL (see the Makefile/report-back
$-- notes on this convention).
#show raw.where(block: false): it => text(
  font: ("DejaVu Sans Mono", "Menlo"),
  size: 9.5pt,
  fill: black,
)[#breakable(it.text)]

$-- Fenced code blocks (the curl/dig/writeLines recipes). Monospace 9pt, a
$-- thin rule down the left, and no background box, so the sheet stays black
$-- and white and prints cleanly. Blocks are NOT run through `breakable`:
$-- the recipes are meant to be typed or pasted verbatim, and inserting
$-- zero-width spaces into them would break a copy-paste.
$-- `#set raw(theme: none)` turns typst's syntax highlighter OFF. Without it
$-- a fence carrying a language tag (```r) renders its tokens in GREEN AND
$-- BLUE, which breaks the black-and-white house rule. Setting it here means
$-- a future language tag is safe rather than a silent color leak.
$-- (Requires typst >= 0.12; this machine has 0.14.2. Note that Quarto's
$-- BUNDLED typst is 0.11 and would reject it -- this Makefile calls the
$-- system `typst`, not Quarto, so that does not apply here.)
#set raw(theme: none)

#show raw.where(block: true): it => block(
  width: 100%,
  inset: (left: 0.8em, top: 0.5em, bottom: 0.5em),
  stroke: (left: 0.6pt + rgb("#434343")),
)[
  #set text(font: ("DejaVu Sans Mono", "Menlo"), size: 9pt, fill: black)
  #it
]

$-- Links: plain underlined black text, not blue, and breakable on the same
$-- punctuation as inline code so a long link label (or an autolinked bare
$-- URL) wraps instead of running off the page.
#show link: it => {
  set text(fill: black)
  underline({
    if type(it.body) == str {
      breakable(it.body)
    } else if it.body.has("text") {
      breakable(it.body.text)
    } else {
      it.body
    }
  })
}

$-- Blockquotes (pandoc's default `blockquote` helper): keep it simple --
$-- slightly smaller text, a left inset, no rule or color.
#let blockquote(body) = block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[
  #set text(size: 0.95em)
  #body
]

$-- Tables: pandoc emits a plain #table(columns: N, align: ..., inset: 6pt,
$-- cell, cell, ...) call with no header/figure markup and -- confirmed by
$-- testing -- NO distinction between header and body rows even when the
$-- source table has a real header: pandoc 3.1.6.1's typst writer drops the
$-- header/body split entirely and serializes every row identically. So a
$-- header can't be detected structurally; this report format uses tables of
$-- exactly two shapes (report-template.md), and column count tells them
$-- apart: the 2-column "At a glance" table is a header-less key/value list,
$-- while wider tables (e.g. the 4-column links table) have a real header in
$-- row 0. Bold row 0 + a rule beneath it only when there are 3+ columns.
$-- Also force left alignment (house style) rather than pandoc's per-table
$-- `align` argument, which is "auto" for undecorated pipe-table columns but
$-- would otherwise win over any #set table(align:) default.
$-- Rebuilding with fractional columns (instead of pandoc's auto columns)
$-- makes the table use the full text width and forces long cell content
$-- (URLs) to wrap rather than stretch the page.
// Rebuilt as a `grid`, not another `table` -- a same-selector replacement
// inside a `show table:` rule re-triggers the rule and typst hits its show-
// rule recursion limit ("maximum show rule depth exceeded"); `grid` shares
// table's layout engine (columns/align/inset/stroke) without the recursion.
#show table: it => {
  let ncols = it.columns.len()
  let has-header = ncols > 2
  grid(
    columns: (1fr,) * ncols,
    align: left,
    inset: 6pt,
    stroke: (x, y) => if has-header and y == 0 { (bottom: 0.6pt + black) } else { none },
    ..it.children.enumerate().map(((i, cell)) => {
      if has-header and calc.floor(i / ncols) == 0 {
        strong(text(size: 10pt)[#cell.body])
      } else {
        text(size: 10pt)[#cell.body]
      }
    })
  )
}

$if(title)$
#align(center)[
  #text(font: heading-font, weight: "bold", size: 20pt)[$title$]
$if(subtitle)$
  #v(0.35em)
  #text(font: heading-font, size: 12pt, fill: mid-gray)[$subtitle$]
$endif$
]
#v(1.2em)
$endif$
$body$
