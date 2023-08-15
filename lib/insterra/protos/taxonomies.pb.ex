defmodule Insterra.Protos.Taxonomies.Category.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:configurable, 1, type: :bool)
end

defmodule Insterra.Protos.Taxonomies.Category do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:rank, 3, type: :int32)
  field(:configurable, 4, type: :bool)
  field(:description, 5, type: :string)
  field(:parent_id, 6, type: :int32)
end

defmodule Insterra.Protos.Taxonomies.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.protos.taxonomies.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListCategories,
    Insterra.Protos.Taxonomies.Category.ListRequest,
    stream(Insterra.Protos.Taxonomies.Category)
  )
end

defmodule Insterra.Protos.Taxonomies.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Taxonomies.Handler.Service
end
