data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["*bionic*"]
  }

}

resource "aws_instance" "myEc2" {
  ami               = data.aws_ami.app_ami.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  tags              = var.aws_common_tag
  security_groups   = [var.sg_name]
  availability_zone = var.availability_zone


  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_location)
      host        = self.public_ip
    }
  }

  root_block_device {
    delete_on_termination = true
  }
}
