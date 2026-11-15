output "container_name" {
  description = "Name of the container provisioned by Terraform"
  value       = docker_container.nginx.name
}

output "nginx_url" {
  description = "Local URL for the Nginx demo container"
  value       = "http://localhost:${var.host_port}"
}

output "docker_network" {
  description = "Docker network provisioned by Terraform"
  value       = docker_network.demo_network.name
}
