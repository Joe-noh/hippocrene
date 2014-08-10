defmodule Mix.Tasks.Hip.Init do
  use Mix.Task

  def run(_) do
    create_directories

    initialize_config_file
    initialize_example_article
    initialize_assets
  end

  defp create_directories do
    File.mkdir_p! "./src/articles"
    File.mkdir_p! "./src/assets/js"
    File.mkdir_p! "./src/assets/css"
    File.mkdir_p! "./src/assets/img"
  end

  defp initialize_config_file do
    File.write! "./src/config.exs", """
    skel
    """
  end

  defp initialize_example_article do
    File.write! "./src/articles/example.exs", """
    skel
    """
  end

  defp initialize_assets do
    File.write! "./src/assets/js/jquery.min.js",  Hippocrene.Vendor.jquery_min_js
    File.write! "./src/assets/css/normalize.css", Hippocrene.Vendor.normalize_css
  end
end
