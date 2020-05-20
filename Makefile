.PHONY: html pdf bootstrap build clean setup dev wkhtmltopdf

clean:
	@rm -rf ./build

wkhtmltopdf:
	@sudo apt update
	@sudo apt -y install wget
	@wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
	@sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb

setup:
	@python3 -c "import gist; gist.setup()"

html:
	@python3 -c "import gist; gist.md_to_html()"

pdf:
	@python3 -c "import gist; gist.html_to_pdf()"

bootstrap:
	@pip3 install -r requirements.txt

build: clean bootstrap setup html pdf

dev: clean setup html pdf