variable "kube_config_path" {
  default = "kube_config"
}

variable "kube_config_context" {
  default = "microk8s"
}

variable "kube_config_context_cluster" {
  default = "microk8s-cluster"
}

variable "app_name" {
  default = "hello-world"
  description = "Prefix for everything, subdomain, etc..."
}

variable "app_image" {
  default = "nginx"
}

variable "app_port" {
  default = "80"
}

variable "my_domain" {
  default = "mydomain.local"
}
