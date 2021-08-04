assignments_ou2 = {
  "account3" = {
    "groups" = {
      "SystemAdministrator" = [
        "AdministratorAccess",
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
  "account4" = {
    "groups" = {
      "SystemAdministrator" = [
        "AdministratorAccess",
      ],
    },
    "users" = {
      "alice@example.com" = [
        "AdministratorAccess",
      ],
      "bob@example.com" = [
        "ReadOnlyAccess",
      ],
      "carol@example.com" = [
        "ReadOnlyAccess",
      ],
    },
  },
}
