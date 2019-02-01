defmodule Permissions.Notation do
  @moduledoc """
  """

  alias Permissions.Definition

  defmacro __using__(_opts \\ []) do
    quote do
      import unquote(__MODULE__)

      @permissions []

      @before_compile unquote(__MODULE__).Writer
      @desc nil
    end
  end

  # PERMISSION

  @doc """
  Define an permission type.

  ## Examples

  Basic definition:

  ```
  permission :super_user, 1, name: "Supper User", group: :admin
  ```
  """
  defmacro permission(identifier, idx, opts \\ []) do
    permission_definition =
      Macro.escape(%Definition{
        idx: idx,
        identifier: identifier,
        name: Keyword.get(opts, :name, identifier),
        group: Keyword.get(opts, :group)
      })

    quote do
      case Enum.filter(@permissions, fn item -> item.idx == unquote(permission_definition).idx end) do
        [] ->
          @permissions [unquote(permission_definition) | @permissions]
          def unquote(identifier)(), do: unquote(permission_definition)

        _ ->
          raise "Permission's idx {#{unquote(permission_definition).idx}} is already used!"
      end
    end
  end
end
