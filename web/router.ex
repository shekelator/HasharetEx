defmodule Hasharet.Router do
  use Hasharet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Hasharet.Auth, repo: Hasharet.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hasharet do
    pipe_through :browser # Use the default browser stack

    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hasharet do
  #   pipe_through :api
  # end
end
