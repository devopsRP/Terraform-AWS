
---

# 🚀 AWS EC2 using Terraform

This code uses Terraform to create an EC2 server on Amazon Web Services.

---

## 📌 Simple Explanation

* The **terraform block** sets AWS as the provider and fixes its version
* The **provider block** selects the Mumbai region (`ap-south-1`)
* The **EC2 resource** creates a virtual machine:

  * AMI → OS of the server
  * Instance type → Size of server (`t3.micro`)
  * Tag → Name of server (**My-Terraform-EC2**)

---

## 🧠 Summary

This code simply creates one EC2 server in AWS with a name and basic configuration.
