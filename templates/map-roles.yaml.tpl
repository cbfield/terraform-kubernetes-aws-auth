%{ for role in roles ~}
- rolearn: ${role.rolearn}
  username: ${role.username}
  groups: %{ if role.groups == [] ~}[]%{ endif ~}
%{ for group in role.groups }
  - ${group}
%{ endfor ~}
%{ endfor ~}
