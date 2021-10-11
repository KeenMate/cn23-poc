defmodule PdfGenerationPoc do
  @moduledoc """
  PdfGenerationPoc keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias PdfGenerationPoc.{Invoice, InvoiceItem, QrGenerator}
  alias PdfGenerationPoc.{Generators, Helpers}

  require Logger

  def print_dummy_invoice(output_path) do
    dummy_invoice = Invoice.get_dummy_invoice()
    dummy_invoice_items = InvoiceItem.get_dummy_items()
    qr_code_base64 = QrGenerator.generate_invoice_qr_code(dummy_invoice)

    static_path = Helpers.get_static_path_for_os()

    cn23_form_content = Phoenix.View.render_to_string(PdfGenerationPocWeb.PdfView, "cn23_form.html",
      invoice: dummy_invoice,
      items: dummy_invoice_items,
      total_gross_weight: get_total(dummy_invoice_items, :net_weight),
      total_value: get_total(dummy_invoice_items, :value),
      invoice_link: Invoice.get_invoice_link(dummy_invoice),
      qr_code_base64: qr_code_base64,
      static_path: static_path,
      layout: {PdfGenerationPocWeb.LayoutView, "pdf_layout.html"}
    )

    File.write("html_output.html", cn23_form_content)

    Generators.PuppeteerPdfSample.render(cn23_form_content, output_path)
  end

  defp get_total(items, key) do
    items
    |> Enum.reduce(0, &(Map.get(&1, key, 0) + &2))
    |> Float.round(2)
  end
end
