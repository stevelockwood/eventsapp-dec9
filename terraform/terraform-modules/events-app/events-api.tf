resource "kubernetes_deployment" "events_api" {
  depends_on = [helm_release.database_server]
  metadata {
    name = "events-api"
    labels = {
      app = "events-api"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "events-api"
        ver = "v1.0"
      }
    }

    template {
      metadata {
        labels = {
          app = "events-api"
          ver = "v1.0"
        }
      }

      spec {
        container {
          image = var.events_api_image
          name  = "events-api"

          port {
            container_port = 8082
          }

          env {
            name  = "DBHOST"
            value = "database-server-mariadb.default"
          }
          env {
            name  = "DBUSER"
            value = "root"
          }
          env {
            name = "DBPASSWORD"
            value_from {
              secret_key_ref {
                name = "database-server-mariadb"
                key  = "mariadb-root-password"
              }
            }
          }
          env {
            name  = "DBDATABASE"
            value = "events_db"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "events_api_service" {
  metadata {
    name = "events-api-service"
    labels = {
      app = "events-api-service"
    }
  }
  spec {
    selector = {
      app = "events-api"
      ver = "v1.0"
    }
    port {
      port        = 8082
      target_port = 8082
      protocol    = "TCP"
    }
    type = "ClusterIP"
  }
}

