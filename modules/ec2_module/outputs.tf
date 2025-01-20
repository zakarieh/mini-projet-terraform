output "ext_ec2_instance_name" {
  value = aws_instance.myEc2
}

output "ext_ec2_instance_id" {
  value = aws_instance.myEc2.id
}


output "ext_ec2_instance_az" {
  value = aws_instance.myEc2.availability_zone
}
 
output "ext_ec2_instance_pulic_ip" {
  value = aws_instance.myEc2.public_ip
}
 