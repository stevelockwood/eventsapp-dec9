module "kubernetes_app" {
  source    = "../terraform-modules/events-app" # <— your module path

  events_api_image     = var.events-api-container
  events_website_image = var.events-website-container
  events_db_init_image = var.events-db-init-container

  depends_on = [module.eks]
}
