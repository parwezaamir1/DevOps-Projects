output "key_name" {
  value = aws_key_pair.deployer.key_name
}

output "instance-id" {
  value = aws_instance.web.public_ip
}

output "application_load_balancer_dns_name" {
  value = aws_lb.application_load_balancer.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.alb_target_group.arn
}

output "application_load_balancer_zone_id" {
  value = aws_lb.application_load_balancer.zone_id
}

output "domain_name" {
  value = var.domain_name
}

output "certificate_arn" {
  value = aws_acm_certificate.acm_certificate.arn
}
