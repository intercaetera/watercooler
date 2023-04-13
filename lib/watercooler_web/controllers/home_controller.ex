defmodule WatercoolerWeb.HomeController do
  use WatercoolerWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(
      conn,
      WatercoolerWeb.HomeLive,
      session: %{}
    )
  end
end
