path "${project}/*" {
  capabilities = ["read", "list", "update", "create", "delete"]
}

path "sys/mounts" {
  capabilities = ["list", "read", "create", "update"]
}

path "sys/mounts/*" {
  capabilities = ["read", "create", "update", "delete", "list"]
}

path "auth/token/create" {
  capabilities = ["update", "create", "read", "sudo"]
}