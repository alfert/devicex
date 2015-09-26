defmodule Devicex do
  use Application

  alias Devicex.ZegIOT

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Devicex.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Devicex.Supervisor]
    Supervisor.start_link(children, opts)
    device_simulator(1000)
  end

  def device_simulator(0), do: :ok
  def device_simulator(count) do
    {:ok, response} = ZegIOT.get("/")
    IO.puts "Got response: #{response.status_code}"
    :timer.sleep(500)
    device_simulator(count-1)
  end

end
