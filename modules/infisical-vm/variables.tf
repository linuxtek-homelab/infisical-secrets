variable "environment" {
  description = "Environment name to add to front of VM name"
  type        = string
  default     = "prod"
}

variable "proxmox_target_node" {
  description = "Target Proxmox node to create the virtual machine on"
  type        = string
  default     = "pve1"
}

variable "template_clone" {
  description = "Virtual machine template name to clone to create the virtual machine"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine to create"
  type        = string
  default     = "infisical"
}

variable "vm_description" {
  description = "Description of the virtual machine to create"
  type        = string
}

variable "vm_cores" {
  description = "Number of vCPU cores for the virtual machine"
  default     = 2
}

variable "vm_memory" {
  description = "Amount of RAM for the virtual machine"
  default     = 4096
}

variable "vm_disk_storage" {
  description = "Location to store VM disk"
  type        = string
  default     = "local"
}

variable "vm_disk_size" {
  description = "Size of hard disk for VM"
  type        = string
  default     = "32G"
}

variable "vm_ipv4_address" {
  description = "Static IPv4 Address/Mask to set"
  type        = string
}

variable "vm_ipv4_subnet_mask" {
  description = "Subnet Mask for static IP"
  type        = string
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