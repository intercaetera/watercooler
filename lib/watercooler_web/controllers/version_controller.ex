defmodule WatercoolerWeb.VersionController do
  use WatercoolerWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{ vsn: vsn() })
  end

  defp vsn() do
    Application.spec(:watercooler, :vsn) |> List.to_string()
  end
end
