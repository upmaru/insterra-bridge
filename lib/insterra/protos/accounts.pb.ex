defmodule Insterra.Protos.Accounts.OrganizationReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Accounts.UserReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Accounts.Organization.Metric do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:category_name, 1, type: :string)
  field(:count, 2, type: :int32)
end

defmodule Insterra.Protos.Accounts.Organization.Registration do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:name, 1, type: :string)
  field(:provider, 2, type: :string)
  field(:uid, 3, type: :string)
  field(:metrics, 4, repeated: true, type: Insterra.Protos.Accounts.Organization.Metric)
end

defmodule Insterra.Protos.Accounts.Organization.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Accounts.Organization)
end

defmodule Insterra.Protos.Accounts.Organization do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:metrics, 2, repeated: true, type: Insterra.Protos.Accounts.Organization.Metric)
end

defmodule Insterra.Protos.Accounts.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.accounts.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :RegisterOrganization,
    Insterra.Protos.Accounts.Organization.Registration,
    Insterra.Protos.Accounts.Organization.Response
  )
end

defmodule Insterra.Protos.Accounts.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Accounts.Handler.Service
end
