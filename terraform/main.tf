resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_network" "demo_network" {
  name = "terraform-demo-network"
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  networks_advanced {
    name = docker_network.demo_network.name
  }
}
