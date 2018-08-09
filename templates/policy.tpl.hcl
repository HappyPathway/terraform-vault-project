path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}


path "sys/mounts/*" {
  capabilities = ["update", "create"]
}


path "sys/policy/${project}-*" {
  capabilities = ["update", "create"]
}
