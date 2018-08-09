data "template_file" "project_admin_policy" {
  template = "${file("${path.module}/templates/policy-admin.hcl.tpl")}"

  vars {
    project = "${var.project}"
  }
}

resource "vault_policy" "project_admin_policy" {
  name   = "${var.project}-admin"
  policy = "${data.template_file.project_admin_policy.rendered}"
}

data "template_file" "project_dev_policy" {
  template = "${file("${path.module}/templates/policy-dev.hcl.tpl")}"

  vars {
    project = "${var.project}"
  }
}

resource "vault_policy" "project_dev_policy" {
  name   = "${var.project}-dev"
  policy = "${data.template_file.project_dev_policy.rendered}"
}

data "template_file" "github_admin_team" {
    template = "${file("${path.module}/templates/github_teams.json.tpl")}"
    vars = {
        vault_policy = "${var.project}-admin"
    }
}

resource "vault_generic_secret" "github_teams" {
  path      = "auth/github/map/teams/${var.project}-admin"
  data_json = "${data.template_file.github_admin_team.rendered}"
}


data "template_file" "github_dev_team" {
    template = "${file("${path.module}/templates/github_teams.json.tpl")}"
    vars = {
        vault_policy = "${var.project}-dev"
    }
}

resource "vault_generic_secret" "github_dev_team" {
  path      = "auth/github/map/teams/${var.project}-dev"
  data_json = "${data.template_file.github_dev_team.rendered}"
}

resource "vault_mount" "credentials" {
  path = "${var.project}/credentials"
  type = "generic"
  description = "Static Credentials Mount for ${var.project}"
}