# Sock

Sock is a specification for apps to service WebSocket connections. You can think
of it as 'Plug for WebSockets'. Web servers such as
[Bandit](https://github.com/mtrudel/bandit/) or
[Cowboy](https://github.com/ninenines/cowboy) are expected to implement support
for hosting Sock-based applications (possibly by way of an adapter library such
as [Plug.Cowboy](https://github.com/elixir-plug/plug_cowboy/). WebSocket aware
applications such as Phoenix can then be hosted within an supported web server
simply by defining conformance to the `Sock` behaviour, in the same manner as
how Plug conformance allows their HTTP aspects to be hosted within an arbitrary
web server.

The Sock specification is just that; a specification. There is no actual *code*
in this specification as there is within the Plug specification. What you will
find here consists of a few interfaces along with conventions as to how they
reflect the lifecycle of a WebSocket connection:

* The `Sock` behaviour describes the functions that an application must
  implement in order to be Sock compliant. It is the equivalent of the `Plug`
  interface, but for WebSocket connections. Server implementations are expected
  to allow users to define which user-provided module is to be used as the `Sock`
  implementation for a given server (in a manner similar to `Plug`).
* The `Socket` protocol describes a mechanism for Sock applications to send data
  to a connected WebSocket client. It is the equivalent of the `Plug.Conn`
  interface, but for WebSocket connections. Server inplementations are expected
  to provide a concrete implementation of this protocol for whichever type is
  passed in to `Sock` calls as the socket value.

The above is intended primarily as a high-level overview to provide a conceptual
understanding of how all the building blocks of `Sock` fit together. For more
information, consult the [docs](https://hexdocs.pm/sock).

## WebSocket Lifecycle

* TODO desc the websocket lifecycle (use mermaid)

## Installation

The sock package can be installed by adding `sock` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sock, "~> 0.1.0"}
  ]
end
```

Documentation can be found at <https://hexdocs.pm/sock>.

## License

MIT
