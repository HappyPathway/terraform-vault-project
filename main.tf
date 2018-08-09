data "template_file" "project_policy" {
  template = "${file("${path.module}/policy.hcl.tpl")}"

  vars {
    project = "${var.project}"
  }
}

resource "vault_policy" "project_policy" {
  name   = "${var.project}-admin"
  policy = "${data.template_file.project_policy.rendered}"
}

resource "vault_auth_backend" "github_project" {
  type = "github"
  path = "${var.project}-github"
}

data "template_file" "github_org" {
    template = "${file("${path.module}/templates/github_org.json.tpl")}"
    vars = {
        organization = "${var.organization}"
    }
}
resource "vault_generic_secret" "github_org" {
  path      = "auth/${var.project}-github/config"
  data_json = "${data.template_file.github_org.rendered}"
}

data "template_file" "github_teams" {
    template = "${file("${path.module}/templates/github_teams.json.tpl")}"
    vars = {
        vault_policy = "${var.project}-admin"
    }
}

resource "vault_generic_secret" "github_org" {
  path      = "auth/${var.project}-github/teams/${var.project}-admin"
  data_json = "${data.template_file.github_teams.rendered}"
}

