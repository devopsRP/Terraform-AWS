resource "aws_lambda_function" "auto-lambda-func" {
    function_name = "my_terraform_lambda"
    role = "arn:aws:iam::025857592230:role/lambda-execution-role"
    handler = "index.handler"
    runtime = "nodejs18.x"
    filename = "function.zip"

}