# configuration, edit these values if necessary
mexdown_dir=$(shell dirname $(shell pwd))
build_dir=build
tex_src=./cv.tex
bipp_src=
document_name=$(shell basename $(shell pwd))

####################
# mexdown makefile #
####################
# only edit if you know what you're doing; the point of no return
TEX_ENGINE=xelatex
TEX_ENGINE_FLAGS=-enable-write18 -halt-on-error -file-line-error
BIPP=biber # Bibliography Information Processing Program
RM=rm -f
COPY_BIPP_SRC=echo $(bipp_src) | xargs cp -t $(build_dir)
CHECK_BUILD=if [ ! -d "./$(build_dir)" ];then mkdir $(build_dir); fi


tex_to_pdf=export TEXMFHOME=.:$(mexdown_dir):$(TEXMFHOME); $(TEX_ENGINE) $(TEX_ENGINE_FLAGS) -output-directory=$(build_dir) -jobname=$(document_name) $(tex_src)
# generate PDF
pdf:$(tex_src)
	$(CHECK_BUILD)
	#$(COPY_BIPP_SRC)
	$(tex_to_pdf)
	#cd $(build_dir)/;$(BIPP) $(document_name).bcf
	$(tex_to_pdf)
	$(tex_to_pdf)

# copy over files (e.g. pdfs etc)
# OUT = output directory
# EXT = extension to copy over
EXT=pdf
.PHONY: copy
copy: ;
ifndef OUT
	$(error OUT is not defined.)
endif
ifeq ($(OUT), )
	$(error OUT is defined, but is empty.)
endif
ifndef EXT
	$(error EXT is not defined.)
endif
ifeq ($(EXT), )
	$(error EXT is defined, but is empty.)
endif
	$(shell mkdir -p $(OUT))
ifneq ($(wildcard $(build_dir)/$(document_name).$(EXT)),)
	$(shell cp $(build_dir)/$(document_name).$(EXT) $(OUT))
else
	$(error $(build_dir)/$(document_name).$(EXT) not found.)
endif

# clean build dir
clean:
	$(RM) ./$(build_dir)/*

# purge build dir
purge:
	$(RM) -r ./$(build_dir)
