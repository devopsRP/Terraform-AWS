Here’s a refined **README.md** in clear English, including how to use the Load Balancer DNS in a browser to see your app output:

---

# 🌐 Terraform AWS Web Infrastructure

This project provisions a highly available web infrastructure on AWS using Terraform. It deploys a VPC, subnets, EC2 instances, an Application Load Balancer (ALB), and supporting resources.

---

## 📌 Architecture Overview

The infrastructure includes:

* Custom VPC
* Two public subnets in different Availability Zones
* Internet Gateway for internet access
* Route table with public routing
* Security group allowing HTTP & SSH
* Two EC2 instances running web servers
* Application Load Balancer (ALB)
* Target group with health checks
* S3 bucket

---

## 🛠️ Resources Created

### 1. Networking

* VPC with CIDR block (`var.cidr`)
* Public Subnets:

  * `sub1` → us-east-1a
  * `sub2` → us-east-1b
* Internet Gateway
* Route Table with route to `0.0.0.0/0`
* Subnet associations

---

### 2. Security

* Security Group (`webSg`)

  * Allows HTTP (Port 80) from anywhere
  * Allows SSH (Port 22) from anywhere
  * Allows all outbound traffic

⚠️ **Warning:** Opening SSH to `0.0.0.0/0` is unsafe for production. Restrict it to your IP.

---

### 3. Compute (EC2)

* Two EC2 instances:

  * `webserver1` (Subnet 1)
  * `webserver2` (Subnet 2)
* Instance type: `t3.micro`
* AMI: `ami-098e39bafa7e7303d`
* Key pair: `terrakey`
* User data scripts:

  * `userdata1.sh`
  * `userdata.sh`

These scripts should install and start a web server (e.g., Apache or Nginx).

---

### 4. Load Balancer

* Application Load Balancer (ALB)
* Listener on Port 80
* Target Group:

  * Protocol: HTTP
  * Port: 80
  * Health check path: `/`
* Registers both EC2 instances

---

### 5. Storage

* S3 Bucket:

  * Name: `terra-s3-test-rp-project`

⚠️ Must be globally unique.

---

## 📤 Outputs

After running Terraform, you will get:

* `lodbalancerdns` → Load Balancer DNS
* `public_ip_webserver1` → EC2 instance 1 IP
* `public_ip_webserver2` → EC2 instance 2 IP

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate

```bash
terraform validate
```

### 3. Plan

```bash
terraform plan
```

### 4. Apply

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🌍 Accessing Your Application

After deployment completes:

### Step 1: Get Load Balancer DNS

Terraform will output something like:

```
lodbalancerdns = myalb-1234567890.us-east-1.elb.amazonaws.com
```

---

### Step 2: Open in Browser

Copy the DNS and open it in your browser:

```
http://<load-balancer-dns>
```

Example:

```
http://myalb-1234567890.us-east-1.elb.amazonaws.com
```

---

### ✅ Expected Output

If your `userdata.sh` scripts correctly install a web server, you should see:

* A web page from **webserver1** or **webserver2**
* Refreshing the page may switch between servers (load balancing)

Example outputs:

* "Hello from Web Server 1"
* "Hello from Web Server 2"

---

## 🔁 How Load Balancing Works
g
* ALB receives the request
* Forwards it to one of the EC2 instances
* Distributes traffic evenly
* Performs health checks to ensure instances are running

---

## 📁 Project Structure

```
.
├── main.tf
├── variables.tf
├── userdata.sh
├── userdata1.sh
└── README.md
```

---

## ⚙️ Variables

```hcl
variable "cidr" {
  description = "CIDR block for VPC"
}
```

Example:

```hcl
cidr = "192.168.0.0/16"
```

---

## 🧹 Destroy Resources

To delete everything:

```bash
terraform destroy
```

---

## ⚠️ Important Notes

* Configure AWS credentials:

  ```bash
  aws configure
  ```
* Ensure key pair `terrakey` exists
* Update AMI if region changes
* Make sure your user data installs a web server
* S3 bucket name must be unique globally

---

## 🎯 Final Result

* Highly available web app across 2 AZs
* Load-balanced traffic
* Public access via ALB DNS

---

