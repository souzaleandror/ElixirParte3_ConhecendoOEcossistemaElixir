defmodule Mix.Tasks.Escreve do
  @moduledoc """
    Documentacao complete da tarefa

    `Mix escreve`
  """

  use Mix.Task
  @shortdoc "Escreve um numero aleatorio no arquivo.txt"
  def run(_) do
    IO.puts("Executando codigo 'escreve'")
    ElixirTeste.EscreveNumeroAleatorio.escrever()
  end
end
