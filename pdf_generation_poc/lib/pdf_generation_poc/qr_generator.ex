defmodule PdfGenerationPoc.QrGenerator do
  alias PdfGenerationPoc.Invoice

  def generate_invoice_qr_code(invoice) do
    invoice
    |> Invoice.get_invoice_link()
    |> QRCode.create()
    |> case do
      {:ok, qr_code} ->
        {:ok, QRCode.Svg.to_base64(qr_code)}
      error ->
        error
    end
  end
end
