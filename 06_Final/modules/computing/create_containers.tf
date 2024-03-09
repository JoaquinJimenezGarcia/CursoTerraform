terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

resource "docker_container" "create_containers" {
  count = length(var.image_names) * var.total_containers
  image = element(var.image_names, count.index % length(var.image_names))
  name  = "${var.container_base_name}-${count.index + 1}"
  ports {
    internal = var.internal_port
    external = var.external_port + count.index
  }
}