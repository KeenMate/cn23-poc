import Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to bundle .js and .css sources.
config :pdf_generation_poc, PdfGenerationPocWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "JexWDF8GtRlCsH7JKWEugjabJFQdPMBE3+HlCKLRgYMSEHl+K9SzCB8H6zd+Ucq2",
  watchers: []

config :pdf_generation_poc, public_url: "http://localhost:4000"

config :puppeteer_pdf, exec_path: "node ./node_modules/puppeteer-pdf/puppeteer-pdf"

# Watch static and templates for browser reloading.
config :pdf_generation_poc, PdfGenerationPocWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/pdf_generation_poc_web/(live|views)/.*(ex)$",
      ~r"lib/pdf_generation_poc_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
