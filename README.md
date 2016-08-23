# DerpTeX-LaTeX [![Build Status](https://travis-ci.org/idelsink/latex_templates.svg?branch=master)](https://travis-ci.org/idelsink/latex_templates)

Development branch: [![Build Status](https://travis-ci.org/idelsink/latex_templates.svg?branch=devel)](https://travis-ci.org/idelsink/latex_templates)

DerpTeX is the "fancy" theme name for my LaTeX templates.

The supplied makefile can generate a PDF from these files.

## Templates

Templates tested on:

-   Ubuntu 14.04.3 LTS ([See Travis-ci](https://travis-ci.org/idelsink/latex_templates))
-   Fedora 23
-   Fedora 24

### report

This a template based on a `report` LaTeX class.
The main goal is to write simple and effective LaTeX documents.
The LaTex syntax is nice,
but if we're honest writing in markdown is much more simpler.
Just write the chapters with mixed markdown and LaTeX commands,
include it in the `main.tex` file, and you're done.

For all the features and commands,
see the [features](./report/chapters/features.md) chapter of the given files.

## Dependencies

To make the documentation from the LaTeX source files,
a list of dependencies are needed.
To install these dependencies, run the `install_latex.sh` script in this folder.

## Compilation

The documentation has a custom makefile. With this makefile,
the documentation can be compiled.
All the build executables are made in a 'build' folder.

Make commands available:

-   `make` or `make document`: Build the PDF file from the LaTeX files.
-   `make clean`: Clean the build directory
-   `make purge`: Delete the Build directory
