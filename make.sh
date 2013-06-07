#!/bin/bash

TOCLEAN='[.]/(.*[.](ilg|ind|lof|out|snm|toc|nav|aux|bbl|blg|log|tex~|texbackup|out|idx|maf|mtc[[:digit:]]*)|.*~)'
OPTS=""
TEXINPUTS=".:content:include:figures:"

case $1 in
check)
	sudo apt-get install texlive-latex-recommended texlive-latex-extra \
		texlive-latex-extra texlive-science texlive-lang-french \
		texlive-bibtex-extra texlive-fonts-extra \
		texlive-fonts-recommended texlive-xetex
	;;
clean)
	find . -maxdepth 1 -regextype posix-extended -iregex "$TOCLEAN"  \
		-printf "- %f\n" \
		-delete
	;;
push)
	M=$(date +"%F %T")
	git commit -m"$M" -a
	git push
	;;
*)
	if [ -z "$2" ]; then
		TEX="manuscrit"
	else
		TEX="$2"
	fi
	export TEXINPUTS
	xelatex $OPTS $TEX.tex
	
	for f in $(ls *.aux); do
		bibtex $(basename $f .aux)
	done
	
	makeindex $TEX
	;;
esac
