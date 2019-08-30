defmodule AquarioWeb.PhotoUploader do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :show, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png)
  @acl :public_read

  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname |> String.downcase
    Enum.member?(@extension_whitelist, file_extension)
  end

  def storage_dir(_version, {_file, nil}), do: "uploads/test"
  def storage_dir(_version, {_file, scope}) do
    module_name =
      scope.__struct__
      |> to_string()
      |> String.split(".")
      |> List.last()
      |> String.downcase()

    "uploads/#{module_name}/#{scope.image_token}"
  end

  def transform(:show, _) do
    {:convert, "-thumbnail 260x260^ -gravity center -extent 260x260 -format png", :png}
  end

  def transform(:thumb, _) do
    {:convert, "-thumbnail 32x32^ -gravity center -extent 32x32 -format png", :png}
  end

  def default_url(:show) do
    "/images/fallback/photo_default.png"
  end

  def default_url(:thumb) do
    "/images/fallback/photo_thumb.png"
  end

  def filename(version, _) do
    version
  end
end
