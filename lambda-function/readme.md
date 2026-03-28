
---

# ⚡ AWS Lambda Function using Terraform

This project uses Terraform to deploy a serverless function on Amazon Web Services.

---

## 📌 What this Code Does

This configuration creates an **AWS Lambda function**, which runs your code without needing to manage servers.

---

## 🔍 Code Explanation

### 🔹 Resource Block

```hcl
resource "aws_lambda_function" "auto-lambda-func"
```

* Defines a Lambda function resource in Terraform
* `"auto-lambda-func"` is the internal name used by Terraform

---

### 🔹 Function Name

```hcl
function_name = "my_terraform_lambda"
```

* Name of the Lambda function in AWS

---

### 🔹 IAM Role

```hcl
role = "arn:aws:iam::025857592230:role/lambda-execution-role"
```

* Provides permissions for the Lambda function
* Allows it to access AWS services (like logs, S3, etc.)

---

### 🔹 Runtime

```hcl
runtime = "nodejs18.x"
```

* Defines the environment in which the code runs
* Here, it uses Node.js 18

---

### 🔹 Handler (Entry Point)

```hcl
handler = "index.handler"
```

* Tells Lambda **which file and function to execute**
* Format: `file_name.function_name`

👉 Example:

* `index.handler` means:

  * File → `index.js`
  * Function → `handler`

#### Example Code (index.js)

```javascript
exports.handler = async (event) => {
  return {
    statusCode: 200,
    body: "Hello from Lambda"
  };
};
```

---

### 🔹 Deployment Package (ZIP File)

```hcl
filename = "function.zip"
```

* ZIP file containing your Lambda code

#### Example Structure:

```
function.zip
│── index.js

```

#### Create ZIP:

```bash
zip function.zip index.js
```

---

## 🎯 Why Use Lambda?

* No server management
* Automatic scaling
* Pay only when your code runs
* Useful for APIs, automation, and event-driven tasks

---

## 🧠 Summary

This configuration:

* Deploys a Lambda function using Terraform
* Uses a ZIP file for code
* Defines the entry point using handler
* Assigns permissions using IAM role

👉 In simple terms:
**Terraform uploads your code (ZIP) and tells AWS which function to run (handler).**
