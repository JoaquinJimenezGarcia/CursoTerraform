terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_network" "create_networks" {
  for_each = { for s in var.docker_networks : s.name => s }
  name = each.value.name
  driver = each.value.driver
  ingress = each.value.ingress
  internal = each.value.internal
}