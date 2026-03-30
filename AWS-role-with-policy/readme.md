
---

# 🔐 AWS IAM Role & Policy using Terraform

This code uses Terraform to create an IAM role, define permissions, and attach the policy on Amazon Web Services.

---

## 📌 What this Code Does

* Creates an **IAM Role** (who can use it)
* Creates an **IAM Policy** (what actions are allowed)
* Attaches the policy to the role

👉 Simple: **Role = Identity | Policy = Permissions**

---

## 🔍 Detailed Code Explanation

---

## 🔹 1. IAM Role

```hcl
resource "aws_iam_role" "my-role" {
  name = "my-new-role"
```

* Creates a new IAM role
* `"my-role"` → Terraform internal name
* `"my-new-role"` → Actual name in AWS

---

### 🔸 Assume Role Policy

```hcl
assume_role_policy = jsonencode({
```

* Defines **who can assume (use) this role**
* `jsonencode` converts Terraform code into JSON format required by AWS

---

```hcl
Version = "2012-10-17"
```

* Policy version (standard AWS format)

---

```hcl
Statement = [
```

* List of rules (permissions)

---

```hcl
{
  Action = "sts:AssumeRole"
```

* Allows the action **AssumeRole**
* This means someone/service can use this role

---

```hcl
Effect = "Allow"
```

* Grants permission

---

```hcl
Principal = {
  Service = "ec2.amazonaws.com"
}
```

* Specifies **who can use this role**
* Here → **EC2 instances** can assume this role

👉 Meaning:
**This role can be attached to EC2 instances**

---

## 🔹 2. IAM Policy

```hcl
resource "aws_iam_policy" "my-policy" {
  name = "my-new-policy"
```

* Creates a custom IAM policy
* Defines permissions

---

```hcl
policy = jsonencode({
```

* Converts policy into JSON format

---

```hcl
Action = [
  "ec2:Describe*"
]
```

* Allows all **read-only EC2 actions**
* Example:

  * View instances
  * Describe resources

---

```hcl
Effect = "Allow"
```

* Grants permission

---

```hcl
Resource = "*"
```

* Applies to **all resources**

👉 Meaning:
This policy allows **read-only access to EC2**

---

## 🔹 3. Policy Attachment

```hcl
resource "aws_iam_role_policy_attachment" "my-policy-attachment" {
```

* Connects role + policy

---

```hcl
role = aws_iam_role.my-role.id
```

* Refers to the IAM role created above

---

```hcl
policy_arn = aws_iam_policy.my-policy.arn
```

* Refers to the IAM policy created above

---

👉 Final Meaning:

* Role is created
* Policy is created
* Policy is attached to role

---

## 🎯 How You Use This

1. Attach this IAM role to an EC2 instance
2. That EC2 instance will:

   * Be able to **view EC2 resources**
   * Not modify/delete anything

---

## 🧠 Simple Summary

* **IAM Role** → Who can use it (EC2)
* **IAM Policy** → What it can do (read EC2)
* **Attachment** → Connects both

👉 In simple words:
**You gave EC2 permission to view EC2 resources using this role.**
