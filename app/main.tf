terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
  required_version = "1.10.3"
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["../../.secrets/credentials"]
  profile                  = "eazytraining-tp3"
}

# terraform {
#   backend "s3" {
#     region                   = "us-east-1"
#     profile                  = "eazytraining-tp3"
#     shared_credentials_files = ["../../.secrets/credentials"]
#     bucket                   = "terraform-backend-zakarieh"
#     key                      = "zakarieh-prod.tfstate"
#   }
# }

module "mod_security_groups" {
  source              = "../modules/sg_module"
  security_group_name = local.security_group_name
}

module "mod_eip" {
  source = "../modules/eip_module"
  #   instance_type = module.mod_ec2.ext_ec2_instance_id
}

module "mod_ebs" {
  source = "../modules/ebs_module"
  size   = local.size
  AZ     = local.AZ
}

module "mod_ec2" {
  source               = "../modules/ec2_module"
  instance_type        = local.instance_type
  aws_common_tag       = local.aws_common_tag
  sg_name              = module.mod_security_groups.ext_aws_sg_name
  private_key_location = local.private_key_location
  key_name             = local.key_name
  availability_zone    = local.AZ 

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.mod_ec2.ext_ec2_instance_id
  allocation_id = module.mod_eip.ext_aws_eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.mod_ebs.ext_aws_ebs_volume_id
  instance_id = module.mod_ec2.ext_ec2_instance_id
}

resource "null_resource" "save_pulic_ip" {
  provisioner "local-exec" {
    command = "echo [$(date '+%D %T.%3N')]  PUBLIC IP: ${module.mod_eip.ext_aws_eip_public_ip} ID: ${module.mod_ec2.ext_ec2_instance_id} AZ: ${module.mod_ec2.ext_ec2_instance_az} >> ip_ec2.txt"
  }
}
