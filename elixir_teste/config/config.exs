use Mix.Config

config :elixir_teste, ElixirTeste.Agendador,
  jobs: [
    {"* * * * *", fn -> IO.puts("Executando tarefa agendada") end},
    {"* * * * *", fn -> GenServer.cast(:servidor_aleatorio, :escreve) end}
  ]
