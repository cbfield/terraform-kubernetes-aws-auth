# terraform-kubernetes-aws-auth

A module that creates an `aws-auth` configmap within a given AWS EKS cluster.

Entries in this configmap can be given as vanilla `var.users` and `var.roles` arguments, each with attributes for usernames and groups.

For convenience, the additional arguments `var.fargate_roles` and `var.node_roles` can create entries for roles used by Fargate profiles and EKS node groups, respectively. These simply take lists of ARNs and manage the usernames and groups automatically.
