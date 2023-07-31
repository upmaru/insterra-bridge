defmodule Insterra.Proto.Taxonomies.Category.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:query, 1, type: :string)
end

defmodule Insterra.Proto.Taxonomies.Category do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
end

defmodule Insterra.Proto.Taxonomies.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.proto.taxonomies.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListCategories,
    Insterra.Proto.Taxonomies.Category.ListRequest,
    stream(Insterra.Proto.Taxonomies.Category)
  )
end

defmodule Insterra.Proto.Taxonomies.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Proto.Taxonomies.Handler.Service
end
