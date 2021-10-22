
output "app_name" {
  value = var.app_name
}

output "app_service_ip" {
  value = "${kubernetes_service.app_service.spec.0.cluster_ip}"
}

output "app_ingress" {
  value = "${kubernetes_ingress.app_ingress.spec.0.rule.0.host}"
}
