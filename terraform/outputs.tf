
output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Created public subnet ID"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {
  description = "Created Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "Created public route table ID"
  value       = aws_route_table.public.id
}

output "security_group_id" {
  description = "Created application security group ID"
  value       = aws_security_group.app_sg.id
}

output "iam_role_name" {
  value = aws_iam_role.app_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.app_profile.name
}
output "app_instance_id" {
  value = aws_instance.app_server.id
}

output "app_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "app_public_dns" {
  value = aws_instance.app_server.public_dns
}