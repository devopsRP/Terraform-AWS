
# 🚀 Terraform Execution Flow Guide

This document explains the step-by-step execution flow of Terraform, including configuration validation and what each command does.

---

## 📌 Overview

Terraform follows a standard workflow to provision infrastructure:

**Write → Validate → Plan → Apply → Destroy**

---

## ⚙️ Prerequisites

* Terraform installed
* Amazon Web Services account configured (`aws configure`)
* Valid Terraform configuration files (`.tf`)

---

## 🔍 Step 1: Format Configuration (Optional but Recommended)

```bash
terraform fmt
```

**What it does:**

* Formats your `.tf` files according to Terraform standards
* Improves readability and consistency

---

## ✅ Step 2: Validate Configuration

```bash
terraform validate
```

**What it does:**

* Checks syntax errors in your Terraform code
* Ensures configuration is valid before execution
* ❌ Does NOT connect to AWS or create resources

---

## 📦 Step 3: Initialize Terraform

```bash
terraform init
```

**What it does:**

* Downloads required providers (e.g., AWS)
* Sets up `.terraform` directory
* Prepares working directory for execution

---

## 📊 Step 4: Plan Infrastructure

```bash
terraform plan
```

**What it does:**

* Shows what resources will be created, modified, or destroyed
* Does NOT create resources
* Helps review changes before applying

**Example Output Meaning:**

* `+` → Resource will be created
* `~` → Resource will be modified
* `-` → Resource will be destroyed

---

## 🚀 Step 5: Apply Configuration

```bash
terraform apply
```

**What it does:**

* Creates actual infrastructure on AWS
* Executes the plan generated earlier
* Prompts for confirmation (`yes`)

👉 Example:

* EC2 instance will be created
* Resources defined in `.tf` files will go live

---

## 🧹 Step 6: Destroy Infrastructure (Optional)

```bash
terraform destroy
```

**What it does:**

* Deletes all resources created by Terraform
* Cleans up infrastructure

---

## 🔄 Full Command Flow

```
terraform fmt
terraform validate
terraform init
terraform plan
terraform apply
```

---

## 🧠 Summary

| Command            | Purpose               | Creates Resources? |
| ------------------ | --------------------- | ------------------ |
| terraform fmt      | Format code           | ❌ No               |
| terraform validate | Check syntax          | ❌ No               |
| terraform init     | Initialize project    | ❌ No               |
| terraform plan     | Preview changes       | ❌ No               |
| terraform apply    | Deploy infrastructure | ✅ Yes              |
| terraform destroy  | Delete infrastructure | ✅ Yes (remove)     |

---

## 📌 Notes

* Always run `terraform plan` before `apply`
* Use `validate` to catch errors early
* Keep your state file (`terraform.tfstate`) safe

