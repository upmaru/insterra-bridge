# InsterraProto

Compile `*.proto` with 

```shell
protoc --proto_path=./priv/protos --elixir_out=plugins=grpc:./lib/insterra/protos ./priv/protos/**/*
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `insterra_proto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:insterra_bridge, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/insterra_bridge>.

