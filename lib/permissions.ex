defmodule Permissions do
  @moduledoc """
  Documentation for Permissions.

  ```
  defmodule XPermissions do
    use Permissions.Notation

    permission :super_user, 0,    name: "Super User"

    permission :read_ticket, 2,   name: "Read Ticket",   group: :ticket
    permission :create_ticket, 3, name: "Create Ticket", group: :ticket
    permission :update_ticket, 4, name: "Update Ticket", group: :ticket
    permission :delete_ticket, 50, name: "Delete Ticket", group: :ticket
  end
  ```

  when use this to check permission:
  ```
  defmodule Y do
    def test_is_super_user(value) do
      case XPermissions.has_permissions?(value, [XPermissions.super_user()]) do
        true -> IO.puts("Yes, you are Super User")
        false -> IO.puts("No, you are not Super User")
      end
    end
  end
  ```
  """
end
