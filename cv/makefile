# configuration, edit these values if necessary
DerpTeX_LaTeX_dir=$(shell dirname $(shell pwd)) # directory to the DerpTeX-LaTeX repository
build_dir=build
tex_src=./cv.tex
bipp_src=
document_name=$(shell basename $(shell pwd)) # name of current directory

##########################
# DerpTex-LaTeX makefile #
##########################
# only edit if you know what you're doing; the point of no return
TEX_ENGINE=xelatex
TEX_ENGINE_FLAGS=-enable-write18 -halt-on-error -file-line-error
BIPP=biber # Bibliography Information Processing Program
RM=rm -f
COPY_BIPP_SRC=echo $(bipp_src) | xargs cp -t $(build_dir)
CHECK_BUILD=if [ ! -d "./$(build_dir)" ];then mkdir $(build_dir); fi


tex_to_pdf=export TEXMFHOME=.:$(DerpTeX_LaTeX_dir):$(TEXMFHOME); $(TEX_ENGINE) $(TEX_ENGINE_FLAGS) -output-directory=$(build_dir) -jobname=$(document_name) $(tex_src)
# Generate PDF
pdf:$(tex_src)
	$(CHECK_BUILD)
	#$(COPY_BIPP_SRC)
	$(tex_to_pdf)
	#cd $(build_dir)/;$(BIPP) $(document_name).bcf
	$(tex_to_pdf)
	$(tex_to_pdf)

# Clean build dir
clean:
	$(RM) ./$(build_dir)/*

# Purge build dir
purge:
	$(RM)r ./$(build_dir)
