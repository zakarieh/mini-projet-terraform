output "ext_aws_sg_name" {
  value = aws_security_group.allow_http_https_ssh.name
}