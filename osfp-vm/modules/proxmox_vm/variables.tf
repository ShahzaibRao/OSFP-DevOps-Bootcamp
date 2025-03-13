variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_name" {
  description = "List of VM names"
  type        = list(string)
}

variable "target_nodes" {
  description = "Proxmox nodes where VMs should be created"
  type        = list(string)
}

variable "cores" {
  description = "Number of CPU cores for the VMs"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM in MB for the VMs"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size for the VMs"
  type        = string
  default     = "15G"
}

variable "storage" {
  description = "Storage pool for the VMs"
  type        = string
  default     = "local-lvm"
}
variable "ip_addresses" {
  description = "List of IP addresses for each VM"
  type        = list(string)
}


variable "cloudinit_snippet" {
  description = "Cloud-init customization snippet"
  type        = string
}

variable "ssh_user" {
  description = "Default SSH user"
  type        = string
}

variable "ssh_password" {
  description = "Default SSH password"
  type        = string

  sensitive   = true
}

variable "ssh_keys" {
  description = "SSH public key"
  type        = string
}
