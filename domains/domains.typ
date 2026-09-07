
#let body-font = ("Lora", "Apple Symbols")
#let heading-font = "Montserrat"
#let dark-gray = rgb("#434343")
#let mid-gray = rgb("#666666")
#let zw = "\u{200B}"

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
    [Making All Four of Your Addresses Work -- #n / #total]
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

#show raw.where(block: false): it => text(
  font: ("DejaVu Sans Mono", "Menlo"),
  size: 9.5pt,
  fill: black,
)[#breakable(it.text)]

#set raw(theme: none)

#show raw.where(block: true): it => block(
  width: 100%,
  inset: (left: 0.8em, top: 0.5em, bottom: 0.5em),
  stroke: (left: 0.6pt + rgb("#434343")),
)[
  #set text(font: ("DejaVu Sans Mono", "Menlo"), size: 9pt, fill: black)
  #it
]

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

#let blockquote(body) = block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[
  #set text(size: 0.95em)
  #body
]

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

#align(center)[
  #text(font: heading-font, weight: "bold", size: 20pt)[Making All Four
of Your Addresses Work]
  #v(0.35em)
  #text(font: heading-font, size: 12pt, fill: mid-gray)[Namecheap DNS
and GitHub Pages]
]
#v(1.2em)
== The Four Addresses
<the-four-addresses>
If you are using a custom domain, then four addresses should #emph[all
work].

- `http://carlislerainey.com`
- `https://carlislerainey.com`
- `http://www.carlislerainey.com`
- `https://www.carlislerainey.com`

Your site may have one or more that does not work.

== Testing
<testing>
Open the #strong[Terminal] tab in RStudio, replace my domain with yours
in the script below, and paste the script into the Terminal.

```
D=carlislerainey.com
for u in http://$D https://$D http://www.$D https://www.$D
do
  printf "%-30s " $u
  curl -s -o /dev/null -m 20 -w "%{http_code} %{redirect_url}\n" $u
done
```

- `200` means the page loaded.
- `301` means the URL redirected.
- `000` means the request failed.

If things work, the output should look like this (3 redirected; one
loaded):

```
http://carlislerainey.com        301 https://www.carlislerainey.com/
https://carlislerainey.com       301 https://www.carlislerainey.com/
http://www.carlislerainey.com    301 https://www.carlislerainey.com/
https://www.carlislerainey.com   200
```

== Adding GitHub Pages Records in Namecheap
<adding-github-pages-records-in-namecheap>
In Namecheap, go to #strong[Domain List → Manage → Advanced DNS].

You need nine records.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (auto,auto,auto,).at(col),
  inset: 6pt,
  [Type], [Host], [Value],
  [A Record],
  [`@`],
  [`185.199.108.153`],
  [A Record],
  [`@`],
  [`185.199.109.153`],
  [A Record],
  [`@`],
  [`185.199.110.153`],
  [A Record],
  [`@`],
  [`185.199.111.153`],
  [AAAA Record],
  [`@`],
  [`2606:50c0:8000::153`],
  [AAAA Record],
  [`@`],
  [`2606:50c0:8001::153`],
  [AAAA Record],
  [`@`],
  [`2606:50c0:8002::153`],
  [AAAA Record],
  [`@`],
  [`2606:50c0:8003::153`],
  [CNAME Record],
  [`www`],
  [`USERNAME.github.io`],
)
]

A new Namecheap domain has records already in the list. Delete all of
them before you add the records above.

== The CNAME file picks your real address
<the-cname-file-picks-your-real-address>
Your repository needs a file named `CNAME` with a single line that
contains your domain. In the RStudio console, run this to create the
file (replace my domain with yours):

```
writeLines("www.carlislerainey.com", "CNAME")
```

This file belongs in the project root (e.g., alongside `_quarto.yml`).
Quarto will copy it into `docs/` each time you render the site.

Whatever you write in that file is your real address, and GitHub
redirects the other form to it. If you write `carlislerainey.com`, then
the `www` address redirects to the bare. If you write
`www.carlislerainey.com`, then the bare redirects to the www.

== Turn on HTTPS
<turn-on-https>
Render the site, then commit and push in GitHub Desktop.

Go to your website repository on github.com and click #strong[Settings →
Pages]. Type your domain into #strong[Custom domain] and click
#strong[Save].

GitHub runs a DNS check. This usually takes a few minutes (but can take
up to a day). When it passes, check #strong[Enforce HTTPS].
