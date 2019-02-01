defmodule Permissions.Definition do
  @moduledoc false

  @enforce_keys [:idx, :identifier]
  defstruct [:idx, :identifier, :name, :group]
end
