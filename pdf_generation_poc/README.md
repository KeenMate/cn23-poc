# PdfGenerationPoc

## Before start
You need to install npm dependencies. That is puppeteer-pdf
`npm i`

## Starting server
`iex.bat -S mix phx.server`

## Testing the template
To view the template in browser as HTML page, head to browser and navigate http://localhost:4000/cn23-form

## Test PDF rendering
It is assumed you started iex from root of this project.
`iex> PdfGenerationPoc.print_dummy_invoice("output/cn23-output.pdf")`
Should return something like this:
```
{:ok,
 "{\n  path: 'output/cn23-output.pdf',\n  scale: 1,\n  displayHeaderFooter: true,\n  printBackground: true,\n  landscape: true,\n  format: 'A4',\n  margin: { top: '0px', right: '0px', bottom: '0px', left: '0px' },\n  debug: true,\n  waitUntil: 'networkidle2'\n}\n"}
```
