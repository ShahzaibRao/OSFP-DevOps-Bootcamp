module "osfp_vm" {
  source            = "./modules/proxmox_vm"
  vm_count          = 4
  vm_name           = ["gitlab", "docker", "microk8s", "checkmk"]
  target_nodes      = ["pve1", "pve2"]
  cores             = 2
  memory            = 2048
  disk_size         = "15G"
  storage           = "local-lvm"
  cloudinit_snippet = "local:snippets/qemu-guest-agent.yml"
  proxmox_user      = "your-user-name"
  proxmox_password  = "your_password"
  ssh_user          = "shahzaib"
  ssh_password      = "admin"
  # Pass IP addresses here
  ip_addresses = ["192.168.2.180", "192.168.2.181", "192.168.2.182", "192.168.2.183"]
  ssh_keys     = file("~/.ssh/id_rsa.pub")
}
