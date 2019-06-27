defmodule AquarioWeb.SetLocalePlug do
  def init(opts) do
    opts
  end
  
  def call(conn, opts) do
    locale = conn.params["locale"]

    if locale do   
      Gettext.put_locale(AquarioWeb.Gettext, locale)

      Plug.Conn.put_resp_cookie(conn, "locale", locale)
    else
      locale = conn.req_cookies["locale"] || opts[:default]
      
      Gettext.put_locale(AquarioWeb.Gettext, locale)
      
      conn
    end
  end
end