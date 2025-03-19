resource "proxmox_vm_qemu" "infisical" {
  name        = "${var.environment}-${var.vm_name}"
  desc        = var.vm_description
  target_node = var.proxmox_target_node
  clone       = var.template_clone
  full_clone  = true

  cores  = var.vm_cores
  memory = var.vm_memory

  # Boot and Misc Settings
  agent            = 1            # Enable QEMU Agent for Proxmox to gather more data on the VM
  os_type          = "cloud-init" # Ensure the existing cloud-init is run
  onboot           = true
  automatic_reboot = false
  boot             = "order=scsi0"

  network {
    id        = 0
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
    model     = "virtio"
  }

  nameserver = var.vm_dns_servers
  ipconfig0  = "ip=${var.vm_ipv4_address}/${var.vm_ipv4_subnet_mask},gw=${var.vm_ipv4_gateway}"

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.vm_disk_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = var.vm_disk_size
          storage = var.vm_disk_storage
          format  = "raw"
          backup  = true
          cache   = "writethrough"
        }
      }
    }
  }
}

resource "time_sleep" "wait_for_vm" {
  depends_on      = [proxmox_vm_qemu.infisical]
  create_duration = "120s" # Waits 2 minutes before proceeding
}

resource "null_resource" "wait_for_cloud_init" {

  depends_on = [time_sleep.wait_for_vm]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "debian"
      private_key = file("~/.ssh/id_rsa")
      host        = var.vm_ipv4_address
    }

    inline = [
      "until cloud-init status | grep -q 'done'; do",
      "  echo 'Waiting for cloud-init to complete...';",
      "  sleep 30;",
      "done;",
      "echo 'Cloud-init has completed.'"
    ]
  }
}

resource "ansible_playbook" "run_playbook" {
  # Ansible Provisioner - Runs playbook after VM creation
  # Ensure the Public SSH key for the Terraform runner has alread been injected as part of cloud-init

  depends_on = [null_resource.wait_for_cloud_init]
  playbook   = "../../scripts/ansible-infisical/playbook.yml"
  name       = proxmox_vm_qemu.infisical.name
  replayable = false
  verbosity  = 1

  extra_vars = {
    ansible_host                  = var.vm_ipv4_address
    ansible_ssh_user              = "debian"
    ansible_ssh_private_key_file  = "~/.ssh/id_rsa"
    ansible_ssh_host_key_checking = false
    infisical_site_url            = var.infisical_site_url
    infisical_postgres_password   = var.infisical_postgres_password
    infisical_smtp_host           = var.infisical_smtp_host
    infisical_smtp_port           = var.infisical_smtp_port
    infisical_smtp_from_address   = var.infisical_smtp_from_address
    infisical_smtp_from_name      = var.infisical_smtp_from_name
    infisical_smtp_username       = var.infisical_smtp_username
    infisical_smtp_password       = var.infisical_smtp_password
    infisical_persistent_volume   = var.infisical_persistent_volume
  }
}