import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :watercooler, WatercoolerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "KOG7C2vtzD6t1Ysyc2fo8bob8fuRK8j1oLRI1Q5sg0NM9JHhWD8FlMQN6+OtIOEg",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
