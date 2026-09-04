# Post-render hook (see post-render: in _quarto.yml). After the outer site
# renders, copy the already-built starter site simple/docs/ into docs/example/
# so it is served at /website-workshop/example/ next to the guide and slides.
# quarto render cleans docs/ first, so this runs on every render.
#
# It is an R script rather than a shell script on purpose: Quarto runs .R hooks
# with Rscript and needs no execute bit, which Dropbox strips from shell scripts.
# It works under both the CLI Quarto and RStudio's bundled one (tested 2026-09-04).

unlink("docs/example", recursive = TRUE)
dir.create("docs/example")
file.copy(list.files("simple/docs", full.names = TRUE, all.files = TRUE, no.. = TRUE),
          "docs/example", recursive = TRUE)

# simple/'s about-page CV button renders as a site-root-absolute "/cv.pdf"
# (a Quarto about: quirk; harmless at USERNAME.github.io, a 404 under a
# sub-path). Rewrite it to a relative link in the copy only; simple/ stays as is.
p <- "docs/example/index.html"
writeLines(gsub('href="/cv.pdf"', 'href="cv.pdf"', readLines(p, warn = FALSE), fixed = TRUE), p)
