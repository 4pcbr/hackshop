defmodule Hackshop do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(Hackshop.WebServer, [ [port: 4000, acceptors: 1000] ], function: :run),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hackshop.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
