resource "helm_release" "database_server" {
  name       = "database-server"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "mariadb"
}

