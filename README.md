# infisical-secrets
Docker configuration for Infisical Secrets Manager


Email Config for Infisical
https://infisical.com/docs/self-hosting/configuration/envars#gmail

Bug for getting IPv4 Address: https://github.com/Telmate/terraform-provider-proxmox/issues/1253

Bug for Proxmox ens18 Dependency Failed: https://forum.proxmox.com/threads/debian-11-cloud-image-networking-broken.111655/

Ansible - For the local runner, be sure to disable Strict Host Key Checking:

~/.ssh/config:
```
Host *
    StrictHostKeyChecking no
```