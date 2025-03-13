# Ansible Infrastructure Automation

This repository contains Ansible playbooks to automate the deployment of essential services on a Debian-based infrastructure. The setup includes:

- **GitLab**: Self-hosted Git repository management tool.
- **Docker**: Container runtime for application deployment.
- **MicroK8s**: Lightweight Kubernetes distribution.
- **Checkmk**: IT monitoring solution.

## Prerequisites

Ensure you have the following prerequisites before running the playbooks:

- A Debian-based system with SSH access.
- Ansible installed on the control node:
  ```sh
  sudo apt update && sudo apt install -y ansible
  ```
- SSH key-based authentication between the Ansible control node and managed nodes.
- The managed nodes should have `sudo` privileges.

## Inventory Configuration

The `inventory.ini` file defines the target hosts and their respective groups:

```ini
[all]
gitlab ansible_host=192.168.2.180 ansible_user=shahzaib
docker ansible_host=192.168.2.181 ansible_user=shahzaib
microk8s ansible_host=192.168.2.182 ansible_user=shahzaib
checkmk ansible_host=192.168.2.183 ansible_user=shahzaib

[docker]
docker

[microk8s]
microk8s

[checkmk]
checkmk

[gitlab]
gitlab
```

## Playbooks Overview

### GitLab Installation (`gitlab.yml`)
- Updates APT package index.
- Installs dependencies.
- Adds the GitLab repository and installs GitLab CE.
- Configures external URL and Let's Encrypt settings.
- Reconfigures GitLab and retrieves the root password.

### Docker Installation (`docker.yml`)
- Installs required dependencies.
- Adds the Docker GPG key and repository.
- Installs Docker and enables the service.

### MicroK8s Installation (`microk8s.yml`)
- Ensures `snapd` is installed and running.
- Installs MicroK8s and adds the user to the `microk8s` group.

### Checkmk Installation (`checkmk.yml`)
- Installs required dependencies.
- Downloads and installs the Checkmk package.
- Creates a monitoring site and starts the service.
- Configures Checkmk for external access.

## Running Playbooks

To execute the playbooks, use the following commands:

### Run all playbooks:
```sh
ansible-playbook -i inventory.ini gitlab.yml docker.yml microk8s.yml checkmk.yml
```

### Run individual playbooks:

#### GitLab Installation:
```sh
ansible-playbook -i inventory.ini gitlab.yml
```

#### Docker Installation:
```sh
ansible-playbook -i inventory.ini docker.yml
```

#### MicroK8s Installation:
```sh
ansible-playbook -i inventory.ini microk8s.yml
```

#### Checkmk Installation:
```sh
ansible-playbook -i inventory.ini checkmk.yml
```

## Verification

After running the playbooks, verify the installations:

- **GitLab**: Access `http://gitlab.raoshahzaib.site`
- **Docker**: Run `docker --version`
- **MicroK8s**: Check status using `microk8s status`
- **Checkmk**: Open the web interface at `http://<checkmk-server-ip>/osfp`

## Troubleshooting

- Ensure SSH connectivity:
  ```sh
  ansible all -i inventory.ini -m ping
  ```
- Check logs using `journalctl -u <service-name>`.
- Validate playbooks:
  ```sh
  ansible-playbook --syntax-check gitlab.yml
  ```

## Author
**Shahzaib** - Infrastructure Automation with Ansible

---
This project is designed to automate server provisioning efficiently. Feel free to contribute and improve the configurations!

