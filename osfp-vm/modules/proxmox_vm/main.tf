resource "proxmox_vm_qemu" "osfp" {
  count            = var.vm_count
  name             = var.vm_name[count.index]
  target_node      = var.target_nodes[count.index % length(var.target_nodes)]
  agent            = 1
  cores            = var.cores
  memory           = var.memory
  boot             = "order=scsi0"
  clone            = "debian12-cloudinit"
  full_clone       = true
  scsihw           = "virtio-scsi-single"
  vm_state         = "running"
  automatic_reboot = true

  cicustom     = var.cloudinit_snippet
  ciupgrade    = true
  searchdomain = " "
  #ipconfig0    = "ip=192.168.2.${count.index + 180}/24,gw=192.168.2.1"
  ipconfig0   = "ip=${var.ip_addresses[count.index]}/24,gw=192.168.2.1"
  skip_ipv6    = true
  ciuser       = var.ssh_user
  cipassword   = var.ssh_password
  sshkeys      = var.ssh_keys

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage
          size    = var.disk_size
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = var.storage
        }
      }
    }
  }

  network {
    id     = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
