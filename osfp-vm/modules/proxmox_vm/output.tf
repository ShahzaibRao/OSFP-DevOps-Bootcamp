output "vm_ips" {
  description = "IP addresses of the created VMs"
  value       = var.ip_addresses
}

output "vm_names" {
  description = "Names of the created VMs"
  value       = var.vm_name
}

output "proxmox_nodes" {
  description = "Proxmox nodes where VMs are deployed"
  value       = [for i in range(var.vm_count) : var.target_nodes[i % length(var.target_nodes)]]
}
