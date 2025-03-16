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

