resource "aws_ebs_volume" "ebs" {
  size = var.size
  availability_zone = var.AZ
}