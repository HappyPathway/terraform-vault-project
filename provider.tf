provider "vault" {
  address = "${var.vault_cluster}"
  token   = "${var.vault_token}"
}