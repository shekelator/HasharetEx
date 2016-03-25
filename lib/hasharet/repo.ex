defmodule Hasharet.Repo do
  # use Ecto.Repo, otp_app: :hasharet
  @moduledoc """
    In memory repository
  """

  def all(Hasharet.User) do
      [%Hasharet.User{id: "1", name: "Dave", username: "dave", password: "the cat ran down the road!"}]
  end

  def all(_module), do: []

  def get(module, id) do
      Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
      Enum.find all(module), fn map -> 
        Enum.all?(params, fn {key, val } -> Map.get(map, key) == val end)
      end
  end
end
