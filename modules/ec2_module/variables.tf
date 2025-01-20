variable "instance_type" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "key_name" {
  type    = string
  default = "devops-zakarieh"
}

variable "private_key_location" {
  type        = string
  description = "private key location"
  default     = "../../../.secrets/devops-zakarieh.pem"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-eazytraining"
  }
}

variable "sg_name" {
  type        = string
  description = "set aws security group"
  default     = "what"
}

variable "availability_zone" {

  type        = string
  description = "set aws security group"
  default     = "us-east-1c"
}
