# Laravel Deployment with Infrastructure as Code (IaC)

A Laravel 12 application with Inertia.js and React, automatically deployed to AWS EC2 using Terraform and Ansible. This project serves as a practical introduction to automated deployment with Infrastructure as Code tools.

## About the Project

This repository demonstrates how to automate the deployment of a modern Laravel application using:

- **Laravel 12** - PHP framework 
- **Inertia.js + React** - Frontend stack integrated with Laravel
- **SQLite** - Lightweight and practical database
- **AWS EC2 (Free Tier)** - t3.micro instance for hosting - region: us-east-2
- **Terraform** - Infrastructure provisioning
- **Ansible** - Automated configuration and deployment

## Prerequisites

- Active AWS account
- AWS Access Key created (IAM Security Credentials)
- SSH key pair created to access EC2 (.pem format)
- EC2 instance Security Group configured to allow inbound and outbound traffic
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- [Terraform](https://www.terraform.io/downloads) installed
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed

## Provisioning Infrastructure

### Terraform

Terraform will automatically create the EC2 instance.

```bash
# Initialize Terraform and download the necessary providers
terraform init

# Show the execution plan (preview of changes)
terraform plan

# Apply the changes and create the infrastructure
terraform apply
```
### Configure Ansible Inventory

Enter the public IP of your EC2 instance in the `hosts.yml` file

### Ansible

Ansible will configure the entire environment and install the application:

```bash
# Run the configuration and deploy playbook
ansible-playbook playbook.yml
```

Playbook will:
- ✅ Install PHP 8.3 and necessary extensions
- ✅ Install Composer
- ✅ Install Node.js 20.x & npm
- ✅ Install and configure Nginx
- ✅ Create Laravel project
- ✅ Install Inertia.js and React
- ✅ Configure SQLite database
- ✅ Compile frontend assets
- ✅ Run migrations
- ✅ Configure permissions and environment variables

## Accessing the Application

After deployment, access:

```
http://EC2_PUBLIC_IP
```

<img width="1673" height="996" alt="image" src="https://github.com/user-attachments/assets/433d18d3-316c-42ca-86d6-389d6f2536c6" />
