SHELLCHECK ?= $(shell command -v shellcheck)
EDITORCONFIG_CHECKER ?= $(shell command -v editorconfig-checker)
MARKDOWNLINT ?= $(shell command -v markdownlint)

.PHONY: check
check:
	$(EDITORCONFIG_CHECKER)
	$(MARKDOWNLINT) -c markdownlint.json README.md
	$(SHELLCHECK) example example-inline sane.bash
