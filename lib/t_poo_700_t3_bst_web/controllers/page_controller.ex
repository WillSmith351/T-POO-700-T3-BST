defmodule TPoo700T3BstWeb.PageController do
  use TPoo700T3BstWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
