MANAGE_SCRIPT := ./manage.sh

.PHONY: zip
zip:
	@$(MANAGE_SCRIPT) zip

.PHONY: unzip
unzip:
	@$(MANAGE_SCRIPT) unzip
