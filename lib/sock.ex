defmodule Sock do
  @moduledoc false

  @type opts ::
          binary
          | tuple
          | atom
          | integer
          | float
          | [opts]
          | %{optional(opts) => opts}
          | MapSet.t()

  @typedoc "A WebSocket status code"
  @type status_code :: non_neg_integer()

  @typedoc "The result as returned from many handle_ calls"
  @type handle_result :: {:continue, opts} | {:close, opts} | {:error, term(), opts}

  @callback init(opts) :: opts
  @callback negotiate(conn :: Plug.Conn.t(), opts) ::
              {:accept, Plug.Conn.t(), opts} | {:refuse, Plug.Conn.t(), opts}
  @callback handle_connection(Sock.Socket.t(), opts) :: handle_result()
  @callback handle_text_frame(binary(), Sock.Socket.t(), opts) :: handle_result()
  @callback handle_binary_frame(binary(), Sock.Socket.t(), opts) :: handle_result()
  @callback handle_ping_frame(binary(), Sock.Socket.t(), opts) :: handle_result()
  @callback handle_pong_frame(binary(), Sock.Socket.t(), opts) :: handle_result()

  @callback handle_close(status_code(), Sock.Socket.t(), opts) :: any()
  @callback handle_error(term(), Sock.Socket.t(), opts) :: any()
  @callback handle_timeout(Sock.Socket.t(), opts) :: any()
end

