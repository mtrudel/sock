defprotocol Sock.Socket do
  @moduledoc false
  #
  # A protocol describing the functionality of a WebSocket 'socket' Adapter
  #

  @spec send_text_frame(socket :: t(), data :: binary()) :: :ok
  def send_text_frame(socket, data)

  @spec send_binary_frame(socket :: t(), data :: binary()) :: :ok
  def send_binary_frame(socket, data)

  @spec send_ping_frame(socket :: t(), data :: binary()) :: :ok
  def send_ping_frame(socket, data)

  @spec send_pong_frame(socket :: t(), data :: binary()) :: :ok
  def send_pong_frame(socket, data)
end
