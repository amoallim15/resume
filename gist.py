import os
from datetime import datetime
from markdown import markdown
import pdfkit

TODAY = datetime.now().date()


def setup():
    if not os.path.exists("./build"):
        os.makedirs("./build")


def md_to_html():
    wrapper = open("./wrapper.html").read()
    content = markdown(open("./README.md", "r").read())
    html = wrapper.replace('<div id="content"/>', content)
    open(f"./build/Resume-{TODAY}.html", "w+").write(html)


def html_to_pdf():
    try:
        pdfkit.from_file(f"./build/Resume-{TODAY}.html", f"./build/Resume-{TODAY}.pdf")
    except OSError:
        print(
            (
                "wkhtmltopdf command line tools is not installed probably.\n"
                "download it from here https://wkhtmltopdf.org/downloads.html\n"
                "or simply run:: brew cask install wkhtmltopdf\n\n"
                "If that is not the case, make sure the Resume-{TODAY}.html exists.\n"
            )
        )
