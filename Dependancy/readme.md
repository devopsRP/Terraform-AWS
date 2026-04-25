# Terraform Dependency (AWS VPC & Subnet)

This README explains **dependency in Terraform** using a simple AWS example.

---

## 📌 What is Dependency?

In **Terraform**:

> Dependency means one resource must be created before another.

---

## 🧠 Example

* VPC must be created first
* Subnet is created inside VPC

👉 So, **Subnet depends on VPC**

---

## 🧱 Example Code

### VPC

```hcl
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}
```

---

### Subnet

```hcl
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "example-subnet"
  }
}
```

---

## 🔗 Types of Dependency

### ✅ 1. Implicit Dependency (Best)

```hcl
vpc_id = aws_vpc.vpc.id
```

* Terraform automatically understands dependency
* No need for `depends_on`

---

### ⚠️ 2. Explicit Dependency

```hcl
resource "aws_subnet" "subnet" {
  depends_on = [aws_vpc.vpc]

  vpc_id = aws_vpc.vpc.id
}
```

* Used only when Terraform cannot detect dependency

---

## ⚙️ How Terraform Works

* Builds dependency graph
* Creates resources in correct order
* Runs independent resources in parallel

---


## 🚀 Commands

```bash
terraform init
terraform plan
terraform apply
```

---

## ✅ Key Points

* Dependency = creation order
* Terraform handles it automatically
* Use `depends_on` only if needed

---
