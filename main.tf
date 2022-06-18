resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
    labels = {
      "app.kubernetes.io/created-by" = "Terraform"
      "app.kubernetes.io/managed-by" = "Terraform"
    }
  }

  data = {
    mapRoles = length(concat(var.roles, var.fargate_roles, var.node_roles)) > 0 ? join("\n", flatten([
      length(var.fargate_roles) > 0 ? [chomp(templatefile("${path.module}/templates/fargate-roles.yaml.tpl", {
        roles = var.fargate_roles
      }))] : [],
      length(var.node_roles) > 0 ? [chomp(templatefile("${path.module}/templates/node-roles.yaml.tpl", {
        roles = var.node_roles
      }))] : [],
      length(var.roles) > 0 ? [chomp(templatefile("${path.module}/templates/map-roles.yaml.tpl", {
        roles = var.roles
      }))] : []
    ])) : "[]"
    mapUsers = length(var.users) > 0 ? chomp(templatefile("${path.module}/templates/map-users.yaml.tpl", {
      users = var.users
    })) : "[]"
  }
}
