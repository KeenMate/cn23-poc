defmodule PdfGenerationPocWeb.PdfView do
  use PdfGenerationPocWeb, :view

  def checkbox(assigns) do
    ~H"""
    <label class="custom-checkbox">
      <span class="checkbox">
        <%= if @checked do %>
        <!-- <i class="fas fa-times fa-2x"></i> -->
        <.checked_icon />
        <% end %>
      </span>
      <%= @content %>
    </label>
    """
  end

  def checked_icon(assigns) do
    ~H"""
    <i class="fas fa-times fa-2x"></i>
    """
  end
end
