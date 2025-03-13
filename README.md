# Automating Infrastructure with Terraform, Proxmox & Ansible

## Overview
This project is part of the **OSFP DevOps Bootcamp** led by **Sir Babar Zahoor**. It demonstrates a fully automated lab environment using **Terraform** for VM deployment on **Proxmox** and **Ansible** for configuration management.

## Key Highlights
- ✅ **Terraform** for automated VM provisioning on Proxmox
- ✅ **Ansible** for seamless configuration management
- ✅ **Infrastructure as Code (IaC)** for repeatability and scalability
- ✅ **Fully automated DevOps workflow** for efficiency and consistency

## Technologies Used
- [Terraform](https://www.terraform.io/) - Infrastructure as Code (IaC) tool
- [Proxmox](https://www.proxmox.com/) - Virtualization platform
- [Ansible](https://www.ansible.com/) - Configuration management tool

## Project Workflow
1. **Terraform Deployment**
   - Defines the VM infrastructure in Terraform configuration files.
   - Uses Terraform to deploy **four virtual machines** on **Proxmox**.

2. **Ansible Provisioning**
   - Automates configuration, package installation, and system setup.
   - Ensures all VMs are configured according to the required environment.

3. **Scalability & Automation**
   - Infrastructure as Code (IaC) principles ensure repeatability.
   - Fully automated workflow enhances efficiency in managing infrastructure.

## Getting Started
### Prerequisites
Ensure you have the following installed:
- Terraform
- Proxmox
- Ansible
- SSH access to Proxmox and VMs

### Deployment Steps
1. Clone the repository:
   ```sh
   git https://github.com/ShahzaibRao/OSFP-DevOps-Bootcamp.git
   cd  OSFP-DevOps-Bootcamp
   ```
2. Configure **Terraform** variables as per your Proxmox environment.
3. Initialize Terraform:
   ```sh
   terraform init
   ```
4. Apply Terraform configuration to deploy VMs:
   ```sh
   terraform apply -auto-approve
   ```
5. Run Ansible playbooks to configure VMs:
   ```sh
   ansible-playbook -i inventory setup.yml
   ```

## Conclusion
This lab environment is a perfect demonstration of modern **DevOps** practices, ensuring **consistency** and **automation** in infrastructure management. Excited to keep learning and building! 🚀

