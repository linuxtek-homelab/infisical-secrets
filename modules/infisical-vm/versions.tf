terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    # https://registry.terraform.io/providers/Telmate/proxmox/latest
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc6"
    }

    # https://registry.terraform.io/providers/ansible/ansible/latest  
    ansible = {
      source  = "ansible/ansible"
      version = "1.3.0"
    }
  }
}