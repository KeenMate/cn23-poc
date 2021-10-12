defmodule XlsxProcessingPoc do
  require Logger

  alias XlsxProcessingPoc.{Importer, Exporter}

  def process_export_ets(file_path, output_path) do
    Logger.info("Getting excel data")
    file_path
    |> Importer.get_rows_ets()
    |> log_step("Shifting columns")
    |> shift_columns()
    |> log_step("Writing data to excel file")
    |> Exporter.export_rows(output_path)
    |> log_step("Done!")
  end

  defp shift_columns(rows) do
    first_data = Enum.at(rows, 2)

    rows
    |> Enum.map(fn [order, level, code, parent | rest] ->
      [code, parent, order, level | rest]
    end)
  end

  defp log_step(x, msg) do
    Logger.info(msg)
    x
  end
end
