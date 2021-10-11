defmodule PdfGenerationPocWeb.Router do
  use PdfGenerationPocWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PdfGenerationPocWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PdfGenerationPocWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/cn23-form", PageController, :get_cn23_form
  end

  # Other scopes may use custom stacks.
  # scope "/api", PdfGenerationPocWeb do
  #   pipe_through :api
  # end
end
