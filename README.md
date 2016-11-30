# mexdown [![Build Status](https://travis-ci.org/idelsink/mexdown.svg?branch=master)](https://travis-ci.org/idelsink/mexdown)

Mexdown is the theme name for these LaTeX templates that use markdown.

Mexdown is a combination between *Markdown* and *LaTeX*.
This also translates nice to Mixed Markdown with LaTeX.

The supplied makefile can generate a PDF from these files.

## Templates

Templates tested on:

-   Ubuntu 14.04.3 LTS ([See Travis-ci](https://travis-ci.org/idelsink/mexdown))
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

### CV

This template is based on an empty `moderncv` LaTeX class.
This template was designed with some own design ideas in mind.
The base template isn't that neat,
but the layout of this template is made in such a way that it is customizable.

Look at the example in the `cv.tex` file. See [/cv/cv.tex](./cv/cv.tex)

## Dependencies

To make the documentation from the LaTeX source files,
a list of dependencies are needed.
To install these dependencies, run the `install_latex.sh` script in this folder.

## Compilation

The documentation has a custom makefile. With this makefile,
the documentation can be compiled.
All the build executables are made in a 'build' folder.

Make commands available:

-   `make` or `make pdf`: Build the pdf file from the LaTeX files.
-   `make copy OUT=...`: Copy files from build folder to ...
-   `make clean`: Clean the build directory
-   `make purge`: Delete the Build directory

## License

> You can check out the full license [here](./LICENSE)

This project is licensed under the terms of the **MIT** license.
