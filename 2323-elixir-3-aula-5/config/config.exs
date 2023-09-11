use Mix.Config

config :elixir_teste, ElixirTeste.Agendador, jobs: [
    {"* * * * *", fn -> GenServer.cast(:servidor_aleatorio, :escreve) end}
]