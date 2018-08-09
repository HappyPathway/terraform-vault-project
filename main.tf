data "template_file" "project_policy" {
  template = "${file("${path.module}/templates/policy.hcl.tpl")}"

  vars {
    project = "${var.project}"
  }
}

resource "vault_policy" "project_policy" {
  name   = "${var.project}-admin"
  policy = "${data.template_file.project_policy.rendered}"
}

data "template_file" "github_teams" {
    template = "${file("${path.module}/templates/github_teams.json.tpl")}"
    vars = {
        vault_policy = "${var.project}-admin"
    }
}

resource "vault_generic_secret" "github_teams" {
  path      = "auth/github/map/teams/${var.project}-admin"
  data_json = "${data.template_file.github_teams.rendered}"
}

