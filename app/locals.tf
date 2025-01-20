locals {
  # EC2
  instance_type = "t2.micro"
  aws_common_tag = {
    Name = "ec2-mini-project"
  }
  security_group_name  = "my-sec-group-mini-projet" # Security Group && EIP
  private_key_location = "../../.secrets/devops-zakarieh.pem"
  key_name             = "app-key-name"

  # EBS 
  size = 6
  AZ   = "us-east-1b"
}
