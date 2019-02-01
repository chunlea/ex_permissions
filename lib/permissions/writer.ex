defmodule Permissions.Notation.Writer do
  @moduledoc """
  """
  use Bitwise

  defmacro __before_compile__(_) do
    quote do
      def permissions, do: @permissions

      def permissions_by_group do
        Enum.reduce(@permissions, %{}, fn x, acc ->
          Map.put(acc, x.group, [x | List.wrap(acc[x.group])])
        end)
      end

      def has_permissions?(permissions_string, permissions) do
        (decode_permissions(permissions_string) &&& build_permissions(permissions)) > 0
      end

      def build_permissions(permissions \\ []) do
        Enum.reduce(List.wrap(permissions), 0b0, fn x, acc ->
          acc ||| 0b1 <<< x.idx
        end)
      end

      def encode_permissions(permissions \\ []) do
        :binary.encode_unsigned(build_permissions(permissions))
      end

      def decode_permissions(permissions) do
        :binary.decode_unsigned(permissions)
      end
    end
  end
end
