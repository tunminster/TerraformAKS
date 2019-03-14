output "client_certificate" {
  value = "${module.azure-kubernetes-service.client_certificate}"
}

output "kube_config" {
  value = "${module.azure-kubernetes-service.kube_config}"
}


