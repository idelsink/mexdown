# LaTeX templates

Some LaTeX templates.

The supplied makefile can generate a PDF from these files.

## Templates

### report

Tested on:

-   Ubuntu 14.04.3 LTS
-   Fedora 23

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
