# makefile for documentation
LATEX_PDF=xelatex
LATEXFLAGS=-enable-write18
BIBTEX=biber
RM=rm -f
BUILD_DIR=build
COPY_BIB=echo $(bibtex_src) | xargs cp -t $(BUILD_DIR)
CHECK_BUILD=if [ ! -d "./$(BUILD_DIR)" ];then	\
				mkdir $(BUILD_DIR);     		\
			fi
# directory to the DerpTeX-LaTeX repository
DERPTEX_LATEX_DIR=$(shell dirname $(shell pwd))
latex_src=./cv.tex
bibtex_src=

# Generate PDF
document_name=document
latex_to_pdf=export TEXMFHOME=.:$(DERPTEX_LATEX_DIR):$(TEXMFHOME); $(LATEX_PDF) $(LATEXFLAGS) -output-directory=$(BUILD_DIR) -jobname=$(document_name) $(latex_src)
documentation:$(latex_src)
			  $(CHECK_BUILD)
			  #$(COPY_BIB)
			  $(latex_to_pdf)
			  #cd $(BUILD_DIR)/;$(BIBTEX) $(document_name).bcf
			  $(latex_to_pdf)
			  $(latex_to_pdf)

# Clean build dir
clean:
	$(RM) ./$(BUILD_DIR)/*

# Purge build dir
purge:
	$(RM)r ./$(BUILD_DIR)
