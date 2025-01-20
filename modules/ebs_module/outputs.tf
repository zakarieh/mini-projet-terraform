output "ext_aws_ebs_volume_id" {
  value = aws_ebs_volume.ebs.id
}
output "ext_aws_ebs_volume_size" {
  value = aws_ebs_volume.ebs.size
}
output "ext_aws_ebs_volume_AZ" {
  value = aws_ebs_volume.ebs.availability_zone
}
