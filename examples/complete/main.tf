module "my_module" {
  source = "../../"

  fargate_roles = [
    "arn:aws:iam::111222333444:role/my-fargate-role",
  ]

  node_roles = [
    "arn:aws:iam::111222333444:role/my-node-role",
  ]

  map_roles = [
    {
      rolearn  = "arn:aws:iam::111222333444:role/somebody"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]

  map_users = [
    {
      rolearn  = "arn:aws:iam::111222333444:user/somebody"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]
}
