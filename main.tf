provider "aws" {
  region = var.instance_region
  profile = "destination"
  assume_role {
    # The role ARN within Account B to AssumeRole into. Created in step 1.
    role_arn    = "arn:aws:iam::864413304142:role/OrganizationAccountAssumeRole"
  }
}

resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.instance.id]
  subnet_id = var.subnet_id
	iam_instance_profile = aws_iam_instance_profile.instance_test_profile.name
  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  vpc_id = var.instance_vpcid
  name = "terraform-example-instance"
  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "instance_test_profile" {
  name = "instance_test_profile"
  role = aws_iam_role.role.name
}
resource "aws_iam_role" "role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
