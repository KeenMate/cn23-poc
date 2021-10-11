defmodule PdfGenerationPoc.Helpers do
  def get_static_path_for_os() do
    path = Path.join([:code.priv_dir(:pdf_generation_poc), "static"])
    path = case :os.type do
      {:win32, _} ->
        path
        |> String.replace_prefix("/", "")
        |> String.replace("/", "\\")

      _ ->
        path
    end

    "file://" <> path
  end
end
