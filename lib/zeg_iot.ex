defmodule Devicex.ZegIOT do
  @moduledoc """
  API for Zühlke's IOT platform.
  """
  use HTTPoison.Base
  @endpoint "https://www.google.de"
  # @endpoint "fritz.box:80"

  def process_url(url) do
    @endpoint <> url
  end

  def process_request_header(headers) do
    [ {"Keep-Alive", "timeout=10"} | headers]
  end

end
