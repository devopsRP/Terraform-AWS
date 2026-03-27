---

# 📦 AWS S3 Bucket using Terraform

This project uses Terraform to create and manage an S3 bucket on Amazon Web Services.

---

## 📌 Code Explanation

### 🔹 Terraform Block

* Defines the required AWS provider
* Locks the provider version to **6.3.0** to avoid unexpected changes

---

### 🔹 Provider Block

* Configures AWS settings
* Sets the region to **ap-south-1 (Mumbai)**
* All resources will be created in this region

---

### 🔹 S3 Bucket Resource

This block creates an S3 bucket:

* **bucket = "my-s3-bucket-r130998"**

  * Defines the name of the S3 bucket
  * Must be **globally unique** across all AWS accounts

* **tags**

  * Used to add metadata to the bucket
  * `name = "My-Terraform-Bucket"` helps identify and organize the resource

---

## 🧠 Summary

This configuration sets up AWS provider and creates a uniquely named S3 bucket with tagging for better management and identification.
