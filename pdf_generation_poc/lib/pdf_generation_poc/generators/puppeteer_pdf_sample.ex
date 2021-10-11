defmodule PdfGenerationPoc.Generators.PuppeteerPdfSample do
  def render(html, output_path) do
    options = [
      margin_left: 0,
      margin_right: 0,
      margin_top: 0,
      margin_bottom: 0,
      format: "A4",
      print_background: false,
      landscape: true,
      display_header_footer: false,
      debug: true,
      timeout: 10000
    ]

    PuppeteerPdf.Generate.from_string(html, output_path, options)
  end
end
