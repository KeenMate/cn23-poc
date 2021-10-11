import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pdf_generation_poc, PdfGenerationPocWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "WAd0JD1yF1ffaqS3peB7QmoAGQnro6xkhFdcj0vJhShOzRjQ9Q1aTSWT955g1whk",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
