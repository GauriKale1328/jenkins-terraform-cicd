variable "container_name" {
  description = "Name of the Nginx container created by Terraform"
  type        = string
  default     = "terraform-demo-nginx"
}

variable "image_name" {
  description = "Docker image used for the Terraform provisioning demonstration"
  type        = string
  default     = "nginx:alpine"
}

variable "host_port" {
  description = "Host port mapped to Nginx container port 80"
  type        = number
  default     = 8088
}
