defmodule PdfGenerationPoc.Invoice do

  def get_invoice_link(%{invoice_number: ino} = _invoice) do
    Application.get_env(:pdf_generation_poc, :public_url) <> "/invoice/#{ino}"
  end

  def get_dummy_invoice() do
    %{
      from_initials: "",
      from_business: "Belazu Ingredient Company",
      from_postcode: "UB6 8LZ",
      from_city: "Greenford",
      from_country: "Great Britain",
      from_street: "74 Long Drive",
      from_phone: "020 8453 1958",
      to_initials: "",
      to_business: "Keenmate Notes s.r.o.",
      to_postcode: "71300",
      to_city: "Ostrava - Hermanice",
      to_country: "Czech Republic",
      to_street: "Nad Vodarnou 744/24",
      to_phone: "+420 725 475 42",
      importer_tax_code: "",
      importer_email: "",
      # total_gross_weight: "",
      # total_value: "",
      explanation: "",
      item_category: "sale_of_goods",
      custom_item_category: nil,
      licence_included: false,
      licence_number: "",
      certificate_included: false,
      certificate_number: "",
      invoice_included: true,
      invoice_number: "1683439",
      postal_charges: ""
    }
  end
end
