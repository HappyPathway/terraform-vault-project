path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}


path "sys/mounts/*" {
  capabilities = ["update", "create"]
}