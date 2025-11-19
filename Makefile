SRC = $(wildcard docs/*.md)
OUT_DIR = output
DOCX = $(OUT_DIR)/Document.docx
REF = reference.docx
#--reference-doc=$(REF)

all: docx

docx:
	if not exist $(OUT_DIR) mkdir $(OUT_DIR)
	pandoc $(SRC) \
		--from markdown \
		-d default.yaml \
		--from=markdown+tex_math_single_backslash+tex_math_dollars+raw_tex \
		--toc \
		--resource-path=docs;pictures \
		--filter pandoc-crossref \
		--citeproc \
		--reference-doc=$(REF) \
		--output=$(DOCX) \
		--to=docx

clean:
	rmdir /s /q output
