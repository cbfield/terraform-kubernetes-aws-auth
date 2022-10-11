%{ for role in roles ~}
- rolearn: ${role}
  username: system:node:{{SessionName}}
  groups:
  - system:bootstrappers
  - system:node-proxier
  - system:nodes
%{ endfor ~}
