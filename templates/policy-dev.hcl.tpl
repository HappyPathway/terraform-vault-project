path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}

path "auth/token/create" {
  capabilities = ["update", "create", "read"]
}