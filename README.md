# InfraForge – Terraform AWS Infrastructure with CI/CD

## Overview

InfraForge is a production-style Infrastructure as Code (IaC) project built using Terraform to provision AWS infrastructure. It follows best practices like modular design, remote state management, and CI/CD automation.

The project supports **multi-environment deployment (dev & prod)** with automated deployment for development and controlled approval-based deployment for production.

---

##  Architecture


<img width="620" height="422" alt="image" src="https://github.com/user-attachments/assets/c5c6017e-13ad-4189-bec3-fc1e963fc0da" />



---

##  Tech Stack

* Terraform (Infrastructure as Code)
* AWS (EC2, VPC, S3, DynamoDB)
* GitHub Actions (CI/CD)
* Bash (User Data provisioning)

---

## 📁 Project Structure


<img width="779" height="422" alt="image" src="https://github.com/user-attachments/assets/5ec5a625-6abc-4d14-aac3-e8bbcfabe6e4" />



---



##  Features Implemented



### ✅ 1. Modular Terraform Design

* Reusable modules for VPC and EC2
* Clean separation of logic and configuration




### ✅ 2. AWS Infrastructure

* Custom VPC
* Public subnet
* Internet Gateway
* Route Table & association
* EC2 instance with Nginx setup via user_data




### ✅ 3. Remote State Management

* S3 bucket used to store Terraform state
* DynamoDB used for state locking to prevent concurrent execution



### ✅ 4. Multi-Environment Setup

* Separate environments:

  * `dev` (for testing)
  * `prod` (for production)
* Same modules reused across environments




### ✅ 5. CI/CD Pipeline (GitHub Actions)

* Automatic deployment to **dev environment**
* Manual approval required for **prod deployment**
* Terraform executed via pipeline (no manual infra changes)

---




## 🔐 Security Considerations

* IMDSv2 enforced on EC2
* Encrypted EBS volumes
* Restricted SSH access (best practice)
* Least privilege principle applied in CI/CD permissions

---


### ✅ 6. Infrastructure Security Scanning (Checkov)

* Integrated Checkov for Terraform security analysis
* Identified misconfigurations like:

  * Unencrypted EBS volumes
  * IMDSv1 usage
  * Overly permissive configurations
* Implemented fixes for critical issues
* Understood how to suppress non-applicable rules with justification




## 🔐 Security Considerations

* IMDSv2 enforced on EC2 (prevents metadata attacks)
* Encrypted EBS volumes for data protection
* Restricted SSH access (best practice)
* Least privilege principle applied in CI/CD permissions
* Infrastructure scanned using Checkov to detect misconfigurations
* Selective rule suppression applied for non-applicable checks



## 🔍 Security Scanning Workflow

```text
Terraform Code → Checkov Scan → Plan → Approval → Apply
```

* Checkov was used to scan Terraform code before deployment
* Pipeline was configured to fail on security issues during testing phase
* Critical issues were fixed, and non-critical issues were evaluated
* Demonstrates shift-left security approach in infrastructure deployment





## 🔄 CI/CD Workflow


<img width="835" height="427" alt="image" src="https://github.com/user-attachments/assets/0d3c3794-86a4-4236-b40f-579f1fa9639c" />



---



##  How to Use

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Plan Infrastructure

```bash
terraform plan
```

### 3. Apply Infrastructure

```bash
terraform apply
```

### 4. Destroy Infrastructure

```bash
terraform destroy
```

---

## 📊 Key Learnings

* Terraform module design and reuse
* Remote state handling using S3
* State locking using DynamoDB
* CI/CD integration with infrastructure
* Environment separation (dev vs prod)
* Debugging real-world infrastructure issues



##  Conclusion

This project demonstrates real-world DevOps practices including Infrastructure as Code, automation, environment isolation, and secure deployment workflows.
