variable "proxmox_api_url" {
  description = "URL to Proxmox API"
  type        = string
  # default = "https://proxmox-server01.example.com:8006/api2/json"
}

variable "proxmox_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
}

variable "proxmox_api_token_secret" {
  description = "Proxmox API Token Secret/Password"
  type        = string
}

variable "tf_state_local" {
  description = "Local file location to the Terraform state file and lock file"
  type        = string
}


