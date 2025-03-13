# Terraform Proxmox VM Deployment

## Overview
This repository contains Terraform configurations for deploying **four virtual machines (VMs)** on a **Proxmox** server. Terraform automates the VM creation process, ensuring consistency and repeatability.

## Infrastructure Details
The Terraform code provisions the following VMs:

| VM Name    | IP Address       | Purpose     |
|------------|-----------------|-------------|
| `gitlab`   | 192.168.2.180   | GitLab Server |
| `docker`   | 192.168.2.181   | Docker Host  |
| `microk8s` | 192.168.2.182   | MicroK8s Cluster |
| `checkmk`  | 192.168.2.183   | Monitoring with Checkmk |

## Requirements
Ensure you have the following installed before running Terraform:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Proxmox VE](https://www.proxmox.com/en/proxmox-virtual-environment)
- A Proxmox API Token with sufficient permissions
- SSH access to Proxmox
- A Proxmox VM template configured for cloud-init

## Terraform Setup
### 1. Clone the Repository
```sh
git clone <your-repo-url>
cd <your-repo-directory>
```

### 2. Configure Terraform Variables
Update the `main.tf` file with your Proxmox details:
```hcl
proxmox_api_url    = "https://your-proxmox-server:8006/"
proxmox_api_token  = "your-proxmox-api-token"
proxmox_node       = "proxmox-node-name"
vm_template        = "debian-cloud-template"

```

### 3. Initialize Terraform
Run the following command to initialize Terraform and download necessary providers:
```sh
terraform init
```

### 4. Plan Deployment
Generate an execution plan to review the changes before applying them:
```sh
terraform plan
```

### 5. Apply Changes
Deploy the VMs on Proxmox:
```sh
terraform apply -auto-approve
```

### 6. Verify Deployment
Once the deployment is complete, verify the created VMs in Proxmox.
```sh
terraform output
```
You can also check the Proxmox web UI for the new VMs.

### 7. Destroy Infrastructure (Optional)
If you need to remove all created resources:
```sh
terraform destroy -auto-approve
```

## Next Steps
- Use **Ansible** to provision these VMs for their respective roles:
  - Install GitLab, Docker, MicroK8s, and Checkmk
  - Configure security settings and networking
- Implement **Terraform remote state** for better management
- Integrate **CI/CD pipelines** for automatic infrastructure updates

## Troubleshooting
If you encounter issues, consider:
- Checking Proxmox logs: `/var/log/syslog`
- Verifying Terraform output for errors
- Ensuring your Proxmox API Token has the correct permissions
- Validating the cloud-init template on Proxmox

## License
This project is licensed under the MIT License. Feel free to modify and use it as needed.

