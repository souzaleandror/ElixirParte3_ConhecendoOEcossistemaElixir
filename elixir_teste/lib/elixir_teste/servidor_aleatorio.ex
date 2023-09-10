defmodule ElixirTeste.ServidorAleatorio do
  use GenServer

  def start_link(_) do
    GenServer.start_link(ElixirTeste.ServidorAleatorio, :ok, name: :servidor_aleatorio)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast(:escreve, _) do
    ElixirTeste.EscreveNumeroAleatorio.escreve()
    {:noreply, %{}}
  end

  def handle_info do
  end
end
