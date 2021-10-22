# {{cookiecutter.name}}

terraform {
  backend "kubernetes" {
    secret_suffix = "${var.app_name}-state"
    load_config_file = true
    config_path = var.kube_config_path
  }
}

provider "kubernetes" {
  config_path = var.kube_config_path
  config_context = var.kube_config_context
  config_context_cluster = var.kube_config_context_cluster
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.app_name
  }
}

resource "kubernetes_ingress" "app_ingress" {
  metadata {
    name = "${var.app_name}-ingress"
    namespace = "${kubernetes_namespace.app_namespace.metadata.0.name}"
  }

  spec {
    backend {
      service_name = "${var.app_name}-app-service"
      service_port = 80
    }

    rule {
      host = "${var.app_name}.${var.my_domain}"

      http {
        path {
          backend {
            service_name = "${var.app_name}-app-service"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}
