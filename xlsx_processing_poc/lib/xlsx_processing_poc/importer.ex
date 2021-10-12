defmodule XlsxProcessingPoc.Importer do
  def get_rows_ets(file_path) do
    {:ok, tid} = import_file(file_path, :ets)
    rows = Xlsxir.get_list(tid)
    :ok = Xlsxir.close(tid)

    rows
  end

  def import_file(file_path, :ets) do
    Xlsxir.multi_extract(file_path, 0)
  end

  def import_file(file_path, :stream) do
    Xlsxir.stream_list(file_path, 0)
  end
end
