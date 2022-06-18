# Complete

This example is meant to show an instantiation of this module with all or most of the available arguments provided.

```hcl
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
      userarn  = "arn:aws:iam::111222333444:user/somebody"
      username = "admin"
      groups   = ["system:masters"]
    }
  ]
}
```

Each of the provided arguments will create an entry in the appropriate part of the `aws-auth` configmap, with all entries appended together in the final configmap. For example, the above instantiation of this module will create an `aws-auth` configmap that looks like this:
```hcl
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::111222333444:role/my-fargate-role
      username: system:node:{{SessionName}}
      groups:
        - system:bootstrappers
        - system:node-proxier
        - system:nodes
    - rolearn: arn:aws:iam::111222333444:role/my-node-role
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::111222333444:role/somebody
      username: admin
      groups:
        - system:masters
  mapUsers: |
    - userarn: arn:aws:iam::111222333444:user/somebody
      username: admin
      groups:
        - system:masters
```

The `fargate_roles` and `node_roles` arguments exist solely for convenience. 

This:
```hcl
fargate_roles = [
  "arn:aws:iam::111222333444:role/my-fargate-role",
]
```

is equivalent to this:
```hcl
map_roles = [
  {
    rolearn  = "arn:aws:iam::111222333444:role/my-fargate-role"
    username = "system:node:{{SessionName}}"
    groups   = [
      "system:bootstrappers",
      "system:node-proxier",
      "system:nodes",
    ]
  }
]
```

Likewise, this:
```hcl
node_roles = [
  "arn:aws:iam::111222333444:role/my-node-role",
]
```

is equivalent to this:
```hcl
map_roles = [
  {
    rolearn  = "arn:aws:iam::111222333444:role/my-node-role"
    username = "system:node:{{EC2PrivateDNSName}}"
    groups   = [
      "system:bootstrappers",
      "system:nodes",
    ]
  }
]
```
