path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}


path "sys/mounts/*" {
  capabilities = ["update", "create", "update", "delete"]
}

path "auth/token/create" {
  capabilities = ["update", "create", "read"]
}