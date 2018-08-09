output "vault_admin_policy" {
    value = "${data.template_file.github_admin_team.rendered}"
}

output "vault_dev_policy" {
    value = "${data.template_file.github_dev_team.rendered}"
}