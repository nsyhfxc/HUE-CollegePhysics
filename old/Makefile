# Version:2021-11-25
# Makefile LaTeX-PDF

PROJECT:=CollegePhysicsNew

BUILD_DIR:=build

OUTPUT:=${BUILD_DIR}/${PROJECT}.pdf

FLAGS:=-xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=${BUILD_DIR}

TEXS:=$(filter-out .fig.tex,$(wildcard *.tex))
FIGS:=$(wildcard *.fig.tex)
WLSS:=$(wildcard *.fig.wls)

FIGS_PDF:=$(addprefix ${BUILD_DIR}/,$(FIGS:.tex=.pdf))
WLSS_PDF:=$(addprefix ${BUILD_DIR}/,$(WLSS:.wls=.pdf))

default: ${BUILD_DIR} ${OUTPUT}
	@echo Makefile: Done!

${OUTPUT}: ${TEXS} ${FIGS_PDF} ${WLSS_PDF}
	latexmk ${FLAGS} ${PROJECT}.tex 

${BUILD_DIR}/%.fig.pdf: %.fig.tex 
	latexmk ${FLAGS} $<

${BUILD_DIR}/%.fig.pdf: %.fig.wls
	wolframscript -script $<

${BUILD_DIR}:
	mkdir -p ${BUILD_DIR}

run:default
	start ${OUTPUT}

output:
	@echo ${OUTPUT}