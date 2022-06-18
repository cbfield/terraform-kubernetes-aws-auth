%{ for user in users ~}
- userarn: ${user.userarn}
  username: ${user.username}
  groups: %{ if user.groups == [] ~}[]%{ endif ~}
%{ for group in user.groups }
  - ${group}
%{ endfor ~}
%{ endfor ~}
