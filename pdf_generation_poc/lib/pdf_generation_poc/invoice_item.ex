defmodule PdfGenerationPoc.InvoiceItem do

  def get_dummy_items() do
    [
      %{
        description: "5kg Rose Harissa",
        quantity: 3,
        net_weight: 15,
        value: 230.85,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Smokey Capia Pepper Pesto",
        quantity: 1,
        net_weight: 1.2,
        value: 12.95,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Smokey Chimichurri",
        quantity: 1,
        net_weight: 0.85,
        value: 15.45,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Green Verbena Harissa",
        quantity: 1,
        net_weight: 1,
        value: 16.45,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Zhoug Paste",
        quantity: 1,
        net_weight: 0.17,
        value: 2.15,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Smokey Chimichurri",
        quantity: 1,
        net_weight: 0.85,
        value: 15.45,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      %{
        description: "Green Verbena Harissa",
        quantity: 1,
        net_weight: 1,
        value: 16.45,
        hs_tarif_number: "09109190",
        country_of_origin: "GB"
      },
      # to make pdf overflow to another page
      # %{
      #   description: "Zhoug Paste",
      #   quantity: 1,
      #   net_weight: 0.17,
      #   value: 2.15,
      #   hs_tarif_number: "09109190",
      #   country_of_origin: "GB"
      # },
      # %{
      #   description: "Zhoug Paste",
      #   quantity: 1,
      #   net_weight: 0.17,
      #   value: 2.15,
      #   hs_tarif_number: "09109190",
      #   country_of_origin: "GB"
      # },
      # %{
      #   description: "Zhoug Paste",
      #   quantity: 1,
      #   net_weight: 0.17,
      #   value: 2.15,
      #   hs_tarif_number: "09109190",
      #   country_of_origin: "GB"
      # },
      # %{
      #   description: "Zhoug Paste",
      #   quantity: 1,
      #   net_weight: 0.17,
      #   value: 2.15,
      #   hs_tarif_number: "09109190",
      #   country_of_origin: "GB"
      # },
      # %{
      #   description: "Zhoug Paste",
      #   quantity: 1,
      #   net_weight: 0.17,
      #   value: 2.15,
      #   hs_tarif_number: "09109190",
      #   country_of_origin: "GB"
      # },
    ]
  end
end
