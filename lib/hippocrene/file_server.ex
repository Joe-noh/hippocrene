defmodule Hippocrene.FileServer do
  use Plug.Builder
  import Plug.Conn

  plug Plug.Static, at: "/", from: "./site"
  plug :not_found

  def not_found(conn, _) do
    send_resp conn, 404, "Oh! 404! Not Found!"
  end
end
