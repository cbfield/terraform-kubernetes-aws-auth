# terraform-kubernetes-aws-auth

A module that creates an `aws-auth` configmap within a given AWS EKS cluster.

Entries in this configmap can be given as vanilla `var.users` and `var.roles` arguments, each with attributes for usernames and groups.

For convenience, the additional arguments `var.fargate_roles` and `var.node_roles` can create entries for roles used by Fargate profiles and EKS node groups, respectively. These simply take lists of ARNs and manage the usernames and groups automatically.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.aws_auth](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fargate_roles"></a> [fargate\_roles](#input\_fargate\_roles) | Convenience variable for granting standard permissions to IAM roles used by Fargate profiles<br>Provide the ARNs of each such role, and group assignments will be made automatically | `list(string)` | `[]` | no |
| <a name="input_node_roles"></a> [node\_roles](#input\_node\_roles) | Convenience variable for granting standard permissions to IAM roles used by node groups<br>Provide the ARNs of each such role, and group assignments will be made automatically | `list(string)` | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | Configurations to grant cluster permissions to IAM roles | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | Configurations to grant cluster permissions to IAM users | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_configmap"></a> [configmap](#output\_configmap) | The configmap created by the module |
| <a name="output_fargate_roles"></a> [fargate\_roles](#output\_fargate\_roles) | The value provided for var.fargate\_roles |
| <a name="output_node_roles"></a> [node\_roles](#output\_node\_roles) | The value provided for var.node\_roles |
| <a name="output_roles"></a> [roles](#output\_roles) | The value provided for var.roles |
| <a name="output_users"></a> [users](#output\_users) | The value provided for var.users |
<!-- END_TF_DOCS -->
