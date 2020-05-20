.PHONY: html pdf bootstrap build clean setup

clean:
	@rm -rf ./build

setup:
	@python3 -c "import gist; gist.setup()"

html:
	@python3 -c "import gist; gist.md_to_html()"

pdf:
	@python3 -c "import gist; gist.html_to_pdf()"
	
bootstrap:
	@pip3 install -r requirements.txt

build: clean bootstrap setup html pdf