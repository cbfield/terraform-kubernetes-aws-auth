output "configmap" {
  description = "The configmap created by the module"
  value       = kubernetes_config_map.aws_auth
}

output "fargate_roles" {
  description = "The value provided for var.fargate_roles"
  value       = var.fargate_roles
}

output "node_roles" {
  description = "The value provided for var.node_roles"
  value       = var.node_roles
}

output "roles" {
  description = "The value provided for var.roles"
  value       = var.roles
}

output "users" {
  description = "The value provided for var.users"
  value       = var.users
}
