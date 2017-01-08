defmodule RepackReminder.PageController do
  use RepackReminder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _param) do
    render conn, "show.html"
  end
end
