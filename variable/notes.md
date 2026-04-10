# variable creation in terraform


--------

### introduction

- **Variables in Terraform are used to make your infrastructure dynamic, reusable, and easy to manage.**
- variable is used to store data in key-value format
                     
                     id = 101
                     name = rp

- we can remove hard coded values from resources script using variable
- we can maintain variable in seprate *.tf file* 

## Why Variables Are Needed in Terraform

1. Avoid Hardcoding Values
2. Reusability Across Environments
3. Better Configuration Management
4. Improve Collaboration
5. Secure Sensitive Data

## Types of variables in terraform 

 1. **INPUT variable** => *input variable are used to supply values to the terraform script*
 2. **OUTPUT variable** => *output variable are used to get the values from terraform dcript after execution*

 



---

# 📘 Terraform Variables 

## 👋 Introduction

When working with Terraform, you often need to reuse values like instance types, region names, or tags. Instead of writing the same values again and again, Terraform provides **variables**.

Variables make your code:

* flexible
* reusable
* easy to manage

---

## 🔹 What is a Variable?

A variable is just a **placeholder for a value**.

Instead of writing:

```hcl
instance_type = "t2.micro"
```

You can write:

```hcl
instance_type = var.instance_type
```

And define the value somewhere else.

👉 This way, you can change the value without changing the main code.

---

## 🛠️ How to Create a Variable

You create a variable using the `variable` block.

```hcl
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

### Explanation:

* `instance_type` → variable name
* `type` → data type (string, number, etc.)
* `default` → optional default value

---

## ⚙️ How to Use a Variable

To use a variable, you write:

```hcl
var.<variable_name>
```

### Example:

```hcl
resource "aws_instance" "example" {
  instance_type = var.instance_type
}
```

---

## 📥 How to Assign Values to Variables

There are multiple ways to assign values:

---

### 1. Using Default Value

If you already defined a default:

```hcl
default = "t2.micro"
```

Terraform will use it automatically.

---

### 2. Using `terraform.tfvars` file

Create a file named:

```
terraform.tfvars
```

Add:

```hcl
instance_type = "t2.small"
```

---

### 3. Using Command Line

```bash
terraform apply -var="instance_type=t2.large"
```

---

### 4. Using Environment Variable

```bash
export TF_VAR_instance_type="t2.nano"
```

---

## 📂 Best Practice (Folder Structure)

```
project/
│── main.tf
│── variables.tf
│── terraform.tfvars
```

* `variables.tf` → define variables
* `terraform.tfvars` → assign values
* `main.tf` → use variables

---

## 🔍 Types of Variables

### String

```hcl
type = string
```

### Number

```hcl
type = number
```

### List

```hcl
type = list(string)
```

### Map

```hcl
type = map(string)
```

---

## 🔐 Sensitive Variables

For passwords or secrets:

```hcl
variable "db_password" {
  type      = string
  sensitive = true
}
```

Terraform will hide this value in output.

---

## 💡 Why Variables Matter

* No hardcoding
* Easy to update values
* Same code works for dev, test, and prod
* Cleaner and more professional code

---

## 🧠 Simple Analogy

Think of variables like a **container**:

* Container name → `instance_type`
* Value inside → `"t2.micro"`

You can change what’s inside without changing the container.

---

## ✅ Conclusion

Variables are one of the most important parts of Terraform.
Once you start using them, your code becomes much cleaner and reusable.


