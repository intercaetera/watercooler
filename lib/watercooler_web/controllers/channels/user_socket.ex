defmodule WatercoolerWeb.UserSocket do
  def connect(_params, socket, _connect_info) do
    IO.inspect("Connected to socket")
    {:ok, socket}
  end

  def id(_socket), do: nil
end
