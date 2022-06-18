# Minimal

This example is meant to show an instantiation of this module with the minimum required configurations to successfully build it.

```hcl
module "aws_auth" {
  source = "../../"
}
```
(All arguments are optional)

Applying the module without providing any arguments will cause an `aws-auth` configmap to be created where `mapRoles` and `mapUsers` are both empty lists, `[]`.
