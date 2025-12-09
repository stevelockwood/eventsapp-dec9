

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "events_web_url" {
  description = "The URL of the events-web LoadBalancer"
  value       = module.kubernetes_app.events_web_url
}
