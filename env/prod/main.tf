terraform {
  backend "local" {
    path = "/home/keitarou/Mounts/NAS/Server/Homelab/terraform-state/virtual-machines/prod/terraform.tfstate"
    lock = true
  }
}

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

provider "ansible" {
}

module "infisical-vm" {
  source              = "../../modules/infisical-vm"
  environment         = "prod"
  vm_name             = "infisical"
  vm_description      = "Infisical Secrets Manager"
  proxmox_target_node = "pve1"
  template_clone      = "debian-12.9.0-amd64-netinst"
  vm_cores            = "4"
  vm_memory           = "8196"
  vm_disk_size        = "32G"
  vm_disk_storage     = var.vm_disk_storage
  vm_ipv4_address     = var.vm_ipv4_address
  vm_ipv4_subnet_mask = var.vm_ipv4_subnet_mask
  vm_ipv4_gateway     = var.vm_ipv4_gateway
  vm_dns_servers      = var.vm_dns_servers

  infisical_site_url          = var.infisical_site_url
  infisical_postgres_password = var.infisical_postgres_password
  infisical_smtp_host         = var.infisical_smtp_host
  infisical_smtp_port         = var.infisical_smtp_port
  infisical_smtp_from_address = var.infisical_smtp_from_address
  infisical_smtp_from_name    = var.infisical_smtp_from_name
  infisical_smtp_username     = var.infisical_smtp_username
  infisical_smtp_password     = var.infisical_smtp_password
  infisical_persistent_volume = var.infisical_persistent_volume
}



