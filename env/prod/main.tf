provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true  # By default Proxmox Virtual Environment uses self-signed certificates.
  pm_log_enable       = false # Set to true to log Terraform to a file for debugging
  pm_log_file         = "terraform-plugin-proxmox.log"
  pm_debug            = false # Set to true to enable global debug mode

  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

terraform {
  backend "local" {
    path = "/home/keitarou/Mounts/NAS/Server/Homelab/terraform-state/virtual-machines/prod/terraform.tfstate"
    lock = true
  }
}

module "infisical" {
  source              = "../../modules/infisical"
  environment         = "prod"
  vm_name             = "infisical"
  vm_description      = "Infisical Secrets Manager"
  proxmox_target_node = "pve1"
  template_clone      = "debian-12.9.0-amd64-netinst"
  vm_cores            = "4"
  vm_memory           = "8196"
  vm_disk_storage     = "ceph-vm"
  vm_disk_size        = "32G"
}



