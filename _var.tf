variable "fargate_roles" {
  description = <<-EOF
    Convenience variable for granting standard permissions to IAM roles used by Fargate profiles
    Provide the ARNs of each such role, and group assignments will be made automatically
  EOF
  type        = list(string)
  default     = []
}

variable "node_roles" {
  description = <<-EOF
    Convenience variable for granting standard permissions to IAM roles used by node groups
    Provide the ARNs of each such role, and group assignments will be made automatically
  EOF
  type        = list(string)
  default     = []
}

variable "roles" {
  description = "Configurations to grant cluster permissions to IAM roles"
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "users" {
  description = "Configurations to grant cluster permissions to IAM users"
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}
