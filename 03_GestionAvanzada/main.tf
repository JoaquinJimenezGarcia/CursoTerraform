terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    local = {}
  }
}

provider "docker" {}
provider "local" {}

resource "docker_image" "nginx" {
  for_each     = toset(var.image_names)
  name         = each.value
  keep_locally = true
}

resource "docker_container" "nginx" {
  count = length(var.image_names) * var.total_containers
  image = element(var.image_names, count.index % length(var.image_names))
  name  = "${var.container_base_name}-${count.index + 1}"
  ports {
    internal = var.internal_port
    external = var.external_port + count.index
  }
}

resource "local_file" "mi_fichero" {
  filename = "Logs"
  content  = format("Deployed %s!",  var.total_containers > 1 ? "everything" : "the container")

  depends_on = [ docker_container.nginx ]
}


data "local_file" "example" {
  filename = "Logs"

  depends_on = [ 
    local_file.mi_fichero
   ]
}

output "file_content" {
  value = data.local_file.example.content
}
