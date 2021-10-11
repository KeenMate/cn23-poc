defmodule PdfGenerationPocWeb.PageController do
  use PdfGenerationPocWeb, :controller

  require Logger

  alias PdfGenerationPoc.{Invoice, InvoiceItem, QrGenerator, Helpers}

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get_cn23_form(conn, _) do
    dummy_invoice = Invoice.get_dummy_invoice()
    dummy_invoice_items = InvoiceItem.get_dummy_items()
    qr_code_base64 = QrGenerator.generate_invoice_qr_code(dummy_invoice)

    conn
    |> assign(:invoice, dummy_invoice)
    |> assign(:items, dummy_invoice_items)
    |> assign(:total_gross_weight, get_total(dummy_invoice_items, :net_weight))
    |> assign(:static_path, Helpers.get_static_path_for_os())
    |> assign(:total_value, get_total(dummy_invoice_items, :value))
    |> assign(:invoice_link, Invoice.get_invoice_link(dummy_invoice))
    |> assign(:qr_code_base64, qr_code_base64)
    |> assign(:static_path, "/")
    # |> put_root_layout(false)
    |> put_root_layout({PdfGenerationPocWeb.LayoutView, "pdf_layout.html"})
    |> put_layout(false)
    |> put_view(PdfGenerationPocWeb.PdfView)
    |> render("cn23_form.html")
  end

  defp get_total(items, key) do
    items
    |> Enum.reduce(0, &(Map.get(&1, key, 0) + &2))
    |> Float.round(2)
  end
end
