defmodule Hasharet.UserView do
    use Hasharet.Web, :view
    alias Hasharet.User

    def first_name(%User{name: name}) do
        name
        |> String.split(" ")
        |> Enum.at(0)
    end
end