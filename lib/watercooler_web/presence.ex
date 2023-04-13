defmodule WatercoolerWeb.Presence do
  use Phoenix.Presence,
    otp_app: :watercooler,
    pubsub_server: Watercooler.PubSub
end
