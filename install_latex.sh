#!/bin/bash
# Install LaTeX and needed deps for the documentation

VERSION="0.1.1"

echo "-- Installing LaTeX dependencies for this project v$VERSION"
echo

YES=""
# Get package manager
DNF_CMD=$(which dnf)
APT_GET_CMD=$(which apt-get)

# Packages per manager
# DNF
DNF_PACKAGE_NAMES=(
    texlive
    texlive-tools
    texlive-babel
    texlive-csquotes
    texlive-biblatex
    texlive-biblatex-apa
    texlive-geometry
    texlive-titling
    texlive-fancyhdr
    texlive-tocloft
    texlive-changepage
    texlive-fontspec
    texlive-titlesec
    texlive-fancyvrb
    texlive-booktabs
    texlive-hyperref
    texlive-xcolor
    texlive-toolbox
    texlive-caption
    texlive-lipsum
    texlive-xetex
    texlive-euenc
    texlive-wrapfig
    texlive-dirtytalk
    texlive-spreadtab
    texlive-multirow
    texlive-collection-fontsrecommended
    texlive-ulem
    texlive-pgf
    texlive-makecell
    texlive-tabularx
    texlive-xargs
    texlive-datetime
    pandoc
    make
)
# apt-get
DEB_PACKAGE_NAMES=(
    texlive
    texlive-latex-extra
    texlive-fonts-recommended
    texlive-bibtex-extra
    texlive-xetex
    latex-xcolor
    lmodern
    texlive-generic-recommended
    pgf
    biber
    pandoc
    make
)

# YES check
if [[ $1 == "YES" ]]; then
    YES="-y"
fi

if [[ ! -z $DNF_CMD ]]; then
    echo "Installing with DNF"
    sudo dnf check-update
    sudo dnf install ${DNF_PACKAGE_NAMES[@]} ${YES}
elif [[ ! -z $APT_GET_CMD ]]; then
    echo "Installing with APT"
    sudo apt-get update
    sudo apt-get install ${DEB_PACKAGE_NAMES[@]} ${YES} --no-install-recommends # No recommended docs of 500+ MB!
else
    echo "package manager not supported"
    exit 1;
fi

echo
echo "-- Done installing the dependencies"
echo
