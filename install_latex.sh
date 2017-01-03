#!/usr/bin/env sh
# Install LaTeX and needed deps for the documentation

VERSION="0.1.1"

echo "-- Installing LaTeX dependencies for this project v$VERSION"
echo

YES=""
# Get package manager
DNF_CMD=$(which dnf)
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
PACMAN_CMD=$(which pacman)

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
    texlive-ltablex
    texlive-moderncv
    texlive-xargs
    texlive-datetime
    texlive-mwe
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
# pacman
PACMAN_PACKAGE_NAMES=(
    texlive-bibtexextra
    texlive-core
    texlive-formatsextra
    texlive-genericextra
    texlive-htmlxml
    texlive-humanities
    texlive-latexextra
    texlive-pictures
    texlive-plainextra
    texlive-pstricks
    texlive-science
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
elif [[ ! -z $YUM_CMD ]]; then
    echo "Installing with YUM"
    sudo yum check-update
    sudo yum install ${DNF_PACKAGE_NAMES[@]} ${YES}
elif [[ ! -z $APT_GET_CMD ]]; then
    echo "Installing with APT"
    sudo apt-get update
    sudo apt-get install ${DEB_PACKAGE_NAMES[@]} ${YES} --no-install-recommends # No recommended docs of 500+ MB!
elif [[ ! -z $PACMAN_CMD ]]; then
    echo "Installing with PACKMAN"
    if [[ ! -z $YES ]]; then
        YES="--noconfirm"
    fi
    sudo pacman -Sy --needed ${YES} ${PACMAN_PACKAGE_NAMES[@]}
else
    echo "package manager not supported"
    exit 1;
fi

echo
echo "-- Done installing the dependencies"
echo
