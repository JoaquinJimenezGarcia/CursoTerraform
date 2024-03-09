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

provider "docker" {}
provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

module "image_containers" {
  source = "./modules/image"
  image_names = var.image_names
}

module "computing" {
  source = "./modules/computing"
  container_base_name = var.container_base_name
  image_names = var.image_names
  total_containers = var.total_containers
  internal_port = var.internal_port
  external_port = var.external_port
}

module "networking" {
    source = "./modules/network"
    docker_networks = var.docker_networks
}
