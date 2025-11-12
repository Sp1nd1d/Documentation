SRC = $(wildcard docs/*.md)
OUT_DIR = output
DOCX = $(OUT_DIR)/Document.docx
REF = reference_word.docx
BIB = references.bib
CSL = gost-r-7-0-5-2008-numeric.csl

all: docx

docx:
	if not exist $(OUT_DIR) mkdir $(OUT_DIR)
	pandoc $(SRC) \
		--from markdown \
		--citeproc \
		--reference-doc=$(REF) \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		--toc \
		--output=$(DOCX)

clean:
	rm -rf $(OUT_DIR)
