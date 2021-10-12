defmodule CsvProcessingPoc do
  @moduledoc """
  Documentation for `CsvProcessingPoc`.
  """

  require Logger

  alias CsvProcessingPoc.Cn23CsvParser, as: Csv

  def process_csv_file(input_path, output_path) do
    Logger.info("Importing csv file")
    csv_rows = import_csv_file(input_path)

    Logger.info("Exporting rows to output")
    :ok = export_into_csv(csv_rows, output_path)

    Logger.info("Done!")
  end

  def export_into_csv(rows, output_path) do
    output_path
    |> File.write!(Csv.dump_to_iodata(rows))
  end

  def import_csv_file(input_path) do
    input_path
    |> File.stream!()
    |> Csv.parse_stream(skip_headers: false)
    |> Stream.map(&shuffle_columns/1)
    |> Enum.to_list()
    |> fix_columns()
  end

  def fix_columns(rows) do
    [headers | rows] = rows
    [parent, code, order, level, _code, _parent, description, desc] = headers

    [
      [parent, code, order, level, "Code2", "Parent2", description, desc]
      | rows
    ]
  end

  def shuffle_columns([order, level, code, parent, code2, parent2, description, desc]) do
    [parent2, code2, order, level, code, parent, description, desc]
  end
end
