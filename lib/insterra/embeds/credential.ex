defmodule Insterra.Embeds.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder

  @valid_attrs ~w(
    username
    password
    resource
    host
    port
    secure
  )a

  @behaviour Insterra.Embeds.Behaviour

  @primary_key false
  embedded_schema do
    field(:username, :string)
    field(:password, :string)
    field(:resource, :string)
    field(:host, :string)
    field(:port, :integer)
    field(:secure, :boolean)
  end

  def changeset(credential, attrs) do
    credential
    |> cast(attrs, @valid_attrs)
    |> validate_required([])
  end

  def editable_fields do
    @valid_attrs
  end

  def sequence, do: nil

  def parse(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> apply_action!(:insert)
  end
end
