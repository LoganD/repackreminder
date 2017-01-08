defmodule RepackReminder.Router do
  use RepackReminder.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RepackReminder do
    pipe_through :browser # Use the default browser stack

    get "/", ReminderController, :index
    resources "/reminders", ReminderController
    get "/test", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", RepackReminder do
  #   pipe_through :api
  # end
end
