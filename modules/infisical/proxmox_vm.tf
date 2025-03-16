resource "proxmox_vm_qemu" "infisical" {
  name        = "${var.environment}-${var.vm_name}"
  desc        = var.vm_description
  target_node = var.proxmox_target_node
  clone       = var.template_clone
  full_clone  = true

  cores  = var.vm_cores
  memory = var.vm_memory

  # Boot and Misc Settings
  agent            = 1 # Enable QEMU Agent for Proxmox to gather more data on the VM
  automatic_reboot = true
  boot             = "order=scsi0;net0"

  network {
    id        = 0
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
    model     = "virtio"
  }

  skip_ipv6 = true
  ipconfig0 = "dhcp"

  disk {    
    type    = "disk"
    slot    = "scsi0"
    size    = var.vm_disk_size
    storage = var.vm_disk_storage    
    format = "qcow2"  
  } 
}