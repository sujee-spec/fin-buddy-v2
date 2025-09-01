# Infrastructure as Code (IaC) - AWS Setup

## Overview
This repository contains **Terraform code** to manage AWS infrastructure, including:
- **AWS Organizational Units (OUs)**
- **AWS Account creation & management**
- **Resource provisioning inside accounts**
- **GitHub Actions CI/CD for Terraform deployments**

## **Automated Terraform Deployment (GitHub Actions)**
This repo uses **GitHub Actions** to automatically validate and apply Terraform changes.

### **Workflow Execution**
- On **Pull Request (PR)** → Runs `terraform plan` and comments output on PR.
- On **Merge to Main** → Runs `terraform apply` to deploy changes.

### **GitHub Variables Required**
| Variable Name | Description |
|------------|-------------|
| `ROOT_GH_ROLE` | IAM Role ARN for Root AWS Account |
| `CORE_GH_ROLE` | IAM Role ARN for Core AWS Account |
| `PRODUCTION_GH_ROLE` | IAM Role ARN for Production AWS Account |
| `STAGING_GH_ROLE` | IAM Role ARN for Staging AWS Account |

---