defmodule Hackshop.WebServer do

  use Plug.Router
  if Mix.env == :dev do
    plug Plug.Logger
  end
  plug :match
  plug :dispatch

  get "/" do
    send_resp( conn, 200, "hello world" )
  end

  match _ do
    send_resp( conn, 404, "Not found" )
  end

  def run( args ) do
    # body = Plug.Conn.read_body(conn)
    { :ok, _pid } = Plug.Adapters.Cowboy.http __MODULE__, args
  end

end
