output "vm_name" {
  value = proxmox_vm_qemu.infisical.name
}

output "vm_ip" {
  value = proxmox_vm_qemu.infisical.ipconfig0
}