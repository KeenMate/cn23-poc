defmodule PdfGenerationPoc.Generators.PdfGeneratorSample do
  alias PdfGenerationPoc.Helpers

  require Logger

  def render(html, output_path) do
    static_path = Helpers.get_static_path_for_os()

    {:ok, tmp_file} = PdfGenerator.generate(html, shell_params: [
      "-O", "Landscape",
      "-B", "0",
      "-L", "0",
      "-R", "0",
      "-T", "0",
      "--user-style-sheet", Path.join([static_path, "assets", "all.css"])
      # "--enable-local-file-access",
      # "--allow", static_path
    ])

    File.cp!(tmp_file, output_path)
    File.rm!(tmp_file)
  end
end
