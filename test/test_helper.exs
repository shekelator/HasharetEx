ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Hasharet.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Hasharet.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Hasharet.Repo)

