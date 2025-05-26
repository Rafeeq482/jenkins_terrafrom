provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name                   = "instance-${each.key}-${var.environment}"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fef0819f181d85b9"]
  subnet_id              = "subnet-06cdf6a7520a97aee"

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "instance-${each.key}-${var.environment}"
  }
}
