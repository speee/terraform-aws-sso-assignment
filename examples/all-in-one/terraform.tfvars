assignments_all = {
  "account1" = {
    "groups" = {
      "SystemAdministrator" = [
        "AdministratorAccess",
      ],
      "Engineer" = [
        "PowerUserAccess",
      ],
      "Manager" = [
        "ReadOnlyAccess",
      ],
    },
    "users" = {
      "alice@example.com" = [
        "AdministratorAccess",
      ],
    },
  },
  "account2" = {
    "groups" = {
      "SystemAdministrator" = [
        "AdministratorAccess",
      ],
      "Engineer" = [
        "PowerUserAccess",
      ],
      "Manager" = [
        "ReadOnlyAccess",
      ],
    },
    "users" = {
      "alice@example.com" = [
        "AdministratorAccess",
      ],
      "bob@example.com" = [
        "ReadOnlyAccess",
      ],
    },
  },
}
