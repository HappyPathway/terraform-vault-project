path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}


path "sys/mounts/*" {
  capabilities = ["update", "create"]
}

path "auth/token/create" {
  capabilities = ["update", "create", "read"]
}