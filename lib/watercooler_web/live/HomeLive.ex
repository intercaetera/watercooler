defmodule WatercoolerWeb.HomeLive do
  use Phoenix.LiveView
  alias Phoenix.PubSub
  alias WatercoolerWeb.Presence

  @lobby "lobby"

  def render(assigns) do
    ~H"""
    <div class="nick-form">
      <h1>Nick Form</h1>
      <form phx-submit="submit">
        <input name="username" />
        <input type="submit" />
      </form>

      <ul>
        <%= for name <- @online_users do %>
          <li><%= name %></li>
        <% end %>
      </ul>
    </div>
    """
  end

  def mount(_params, _assings, socket) do
    PubSub.subscribe(Watercooler.PubSub, "lobby")

    {:ok, assign(socket,
      user_id: nil,
      username: "Unknown User",
      online_users: get_users()
    )}
  end

  def handle_info(%{event: "presence_diff"}, socket) do
    {:noreply, assign(socket,
      online_users: get_users()
    )}
  end

  def handle_event("submit", %{"username" => username}, socket) when not is_nil(socket.assigns.user_id) do
    Presence.update(
      self(),
      @lobby,
      socket.assigns.user_id,
      %{ name: username }
    )

    {:noreply, assign(socket,
      username: username
    )}
  end

  def handle_event("submit", %{"username" => username}, socket) do
    user_id = :erlang.system_time()

    IO.inspect(socket)

    Presence.track(
      self(),
      @lobby,
      user_id,
      %{ name: username }
    )

    {:noreply, assign(socket,
      username: username,
      user_id: user_id
    )}
  end

  defp get_users() do
    Presence.list(@lobby)
    |> Enum.map(fn {_key, value} -> hd(value.metas).name end)
  end
end
