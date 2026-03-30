# Create an IAM role and policy , then attach the policy

#Creates a new IAM role
resource "aws_iam_role" "my-role" {       
    name = "my-new-role"


#Defines who can assume (use) this role
#jsonencode converts Terraform code into JSON format required by AWS
assume_role_policy =jsonencode(  {
    Version   = "2012-10-17"      #Policy version (standard AWS format)
   
    Statement = [    #List of rules (permissions)
        {
          Action = "sts:AssumeRole"       #Allows the action AssumeRole
                                          #This means someone/service can use this role

        Effect = "Allow"
        
        #This role can be attached to EC2 instances
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        } 

    ]
} ) 
  
}


resource "aws_iam_policy" "my-policy" {
    name = "my-new-policy"
     
     policy = jsonencode({
          Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"   #This policy allows read-only access to EC2
      },
    ]

     })
  
}


resource "aws_iam_role_policy_attachment" "my-policy-attachment" {
    role = aws_iam_role.my-role.id
    policy_arn = aws_iam_policy.my-policy.arn
  
}