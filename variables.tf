variable "project" {
  type = "string"
  description = "Vault Project Name"
}

variable "github_token" {
  type = "string"
  description = "Github Token for Team Creation"
}

variable "github_organization" {
    type = "string"
    description = "Github Organization"
}

variable "repo_admin" {
  type = "string"
  description = "Admin Github User Account. Will have admin rights for all code and secrets on team."
}