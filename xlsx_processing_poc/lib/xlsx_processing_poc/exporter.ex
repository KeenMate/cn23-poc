defmodule XlsxProcessingPoc.Exporter do
  require Logger

  alias Elixlsx.{Workbook, Sheet}

  def export_rows(rows, file_path, sheet_name \\ "Sheet 1") do
    sheet =
      sheet_name
      |> Sheet.with_name()
      |> Map.put(:rows, rows)
      |> Sheet.set_cell("E1", "Code2")
      |> Sheet.set_cell("F1", "Parent2")

    Logger.debug("Writing workbook to file")
    %Workbook{sheets: [sheet]}
    |> Elixlsx.write_to(file_path)
  end
end
