resource "kubernetes_deployment" "events_web" {
  depends_on = [helm_release.database_server]
  metadata {
    name = "events-web"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "events-web"
        ver = "v1.0"
      }
    }
    template {
      metadata {
        labels = {
          app = "events-web"
          ver = "v1.0"
        }
      }
      spec {
        container {
          name  = "events-web"
          image = var.events_website_image
          
          env {
            name  = "SERVER"
            value = "http://events-api-service:8082"
          }
          env {
            name  = "SERVICE_PORT"
            value = "8080"
          }
          
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "events_web_svc" {
  metadata {
    name = "events-web-svc"
    labels = {
      app = "events-web-svc"
    }
  }
  spec {
    selector = {
      app = "events-web"
      ver = "v1.0"
    }
    port {
      port        = 80
      target_port = 8080
      protocol    = "TCP"
    }
    type = "LoadBalancer"
  }
}

