terraform {
  required_version = ">= 1.6.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "=3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.2.201:8006/api2/json"
  pm_tls_insecure = true
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_debug        = false
}

variable "proxmox_user" {
  description = "Proxmox API user"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox API password"
  type        = string
  sensitive   = true
}
