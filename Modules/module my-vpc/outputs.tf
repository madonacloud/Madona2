output "region" {
  value = var.region
}

output "vpc_id" {
    value = aws_vpc.demo.id
}

output "internet_gateway" {
  value = aws_internet_gateway.igw.id
}

output "pub_sn_az1_id" {
  value = aws_subnet.pub_sn_az1.id
}

output "pub_sn_az2_id" {
  value = aws_subnet.pub_sn_az2.id
}

output "priv_application_tier_sn_az1_id" {
  value = aws_subnet.priv_application_tier_sn_az1.id
}

output "priv_application_tier_sn_az2_id" {
  value = aws_subnet.priv_application_tier_sn_az2.id
}

output "priv_data_tier_sn_az1_id" {
  value = aws_subnet.priv_data_tier_sn_az1.id
}

output "priv_data_tier_sn_az2_id" {
  value = aws_subnet.priv_data_tier_sn_az2.id
}