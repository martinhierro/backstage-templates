resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name = "${var.app_name}-app"
    namespace = "${kubernetes_namespace.app_namespace.metadata.0.name}"
    labels = {
      App = "${var.app_name}App"
    }
  }

  spec {
    replicas = 0

    selector {
      match_labels = {
        App = "${var.app_name}App"
      }
    }

    template {
      metadata {
        labels = {
          App = "${var.app_name}App"
        }
      }

      spec {
        container {
          image = var.app_image
          name  = "${var.app_name}-app"
          port {
            container_port = var.app_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  metadata {
    name = "${var.app_name}-app-service"
    namespace = "${kubernetes_namespace.app_namespace.metadata.0.name}"
  }
  spec {
    selector = {
      App = "${kubernetes_deployment.app_deployment.spec.0.template.0.metadata.0.labels.App}"
    }
    type = "NodePort"
    port {
      port        = 80
      target_port = var.app_port
    }
  }
}
