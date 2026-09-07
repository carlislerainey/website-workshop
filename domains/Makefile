# domains: domains.md -> domains.pdf
#
# `make` builds the PDF when domains.md or template.typ is newer.
# `make clean` removes the generated domains.typ and domains.pdf.
#
# Pipeline (matches ../../../work-2026-2027/website-review and
# ../../../informal-handbook): pandoc converts the markdown to typst using
# template.typ (house style: Lora/Montserrat, black and white, see that
# file's header comment), then typst compiles the .typ to a .pdf.
# The .typ is a generated INTERMEDIATE. Edit domains.md or template.typ,
# never domains.typ.
#
# Run from this folder (web/domains/):
#   make
#   make clean

all: domains.pdf

domains.typ: domains.md template.typ
	pandoc -s -t typst --template=template.typ $< -o $@

domains.pdf: domains.typ
	typst compile $<

clean:
	rm -f domains.typ domains.pdf

.PHONY: all clean
