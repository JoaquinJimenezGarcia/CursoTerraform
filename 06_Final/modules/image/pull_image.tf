terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "get_images" {
  for_each     = toset(var.image_names)
  name         = each.value
  keep_locally = true
}