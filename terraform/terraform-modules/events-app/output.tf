output "events_web_url" {
  value       = kubernetes_service.events_web_svc.status.0.load_balancer.0.ingress.0.hostname
  description = "The URL of the events-web LoadBalancer"
}

