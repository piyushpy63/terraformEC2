Terraform AWS EC2 Setup

This repository contains Terraform configuration files to provision a basic AWS infrastructure, including:
1. An AWS EC2 instance
2. SSH key pair for secure access
3. Default VPC usage
4. Security group with SSH and HTTP access

```
.
├── main.tf          # Provider configuration (AWS & Kubernetes)
├── resources.tf     # AWS resources (EC2, SG, Key Pair, VPC)
├── awssshkey.pub    # Public SSH key (required)
└── README.md

```
🛠️ Prerequisites

Before you begin, ensure you have
1. Terraform ≥ 1.x installed
2. An AWS account
3. AWS credentials configured locally

🚀 Resources Created
1. AWS Key Pair
Imports your local SSH public key into AWS
Used to access the EC2 instance securely
2. Default VPC
Uses AWS default VPC
Tagged for identification
3. Security Group
Allows:
SSH (22) – from anywhere (⚠️ not recommended for production)
HTTP (80) – from anywhere
Allows all outbound traffic
4. EC2 Instance
Instance type: t3.micro
OS: Ubuntu AMI
Root volume: 8 GB (gp3)
Tagged as junoonforaws
