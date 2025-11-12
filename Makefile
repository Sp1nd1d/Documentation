SRC = $(wildcard docs/*.md)
OUT_DIR = output
DOCX = $(OUT_DIR)/Document.docx
REF = reference_word.docx

all: docx

docx:
	if not exist $(OUT_DIR) mkdir $(OUT_DIR)
	pandoc $(SRC) \
		--from markdown \
		--reference-doc=$(REF) \
		--output=$(DOCX)

clean:
	rm -rf $(OUT_DIR)
