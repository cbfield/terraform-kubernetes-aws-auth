%{ for role in roles ~}
- rolearn: ${role}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
  - system:bootstrappers
  - system:nodes
%{ endfor ~}
