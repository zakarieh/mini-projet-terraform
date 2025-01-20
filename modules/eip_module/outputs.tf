output "ext_aws_eip_public_ip" {
  value = aws_eip.eip.public_ip
}

output "ext_aws_eip_id" {
  value = aws_eip.eip.id
}