provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}

resource "github_team" "admin_team" {
  name        = "${var.project}-admin"
  description = "${var.project} Admin Team"
  privacy     = "closed"
}

resource "github_team" "dev_team" {
  name        = "${var.project}-dev"
  description = "${var.project} Developers Team"
  privacy     = "closed"
}

resource "github_team_membership" "some_team_membership" {
  team_id  = "${github_team.admin_team.id}"
  username = "${var.repo_admin}"
  role     = "maintainer"
}