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

variable "vm_disk_storage" {
  description = "Location to store VM disk"
  type        = string
  default     = "local-lvm"
}

variable "vm_ipv4_address" {
  description = "Static IPv4 Address to set"
  type        = string
}

variable "vm_ipv4_subnet_mask" {
  description = "Subnet Mask for static IP"
  type        = string
  default     = "24"
}

variable "vm_ipv4_gateway" {
  description = "IPv4 Network Gateway"
  type        = string
}

variable "vm_dns_servers" {
  description = "DNS servers to set for the VM"
  type        = string
}

variable "infisical_site_url" {
  description = "URL for the Infisical Server to use"
  type        = string
}

variable "infisical_postgres_password" {
  description = "Password to use for Infisical local PostgreSQL database"
  type        = string
}

variable "infisical_smtp_host" {
  description = "SMTP address to use for Infisical to send email"
  type        = string
}

variable "infisical_smtp_port" {
  description = "Port for Infisical to use to sent email via SMTP"
  type        = string
}

variable "infisical_smtp_from_address" {
  description = "Email address used for email sent by Infisical"
  type        = string
}

variable "infisical_smtp_from_name" {
  description = "Friendly name used for email sent by Infisical"
  type        = string
  default     = "Infisical Secrets Manager"
}

variable "infisical_smtp_username" {
  description = "Username/Email Address for Infisical to use to log into the SMTP server"
  type        = string
}

variable "infisical_smtp_password" {
  description = "Password/App Password for Infisical to use to log into the SMTP server"
  type        = string
}

variable "infisical_persistent_volume" {
  description = "Location for persistant data from Infisical, Redis, and Postgres"
  type        = string
  default     = "/opt/infisical"
}