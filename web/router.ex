defmodule Hasharet.Router do
  use Hasharet.Web, :router

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

  scope "/", Hasharet do
    pipe_through :browser # Use the default browser stack

    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    resources "/users", UserController, only: [:index, :show, :new, :create]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hasharet do
  #   pipe_through :api
  # end
end
