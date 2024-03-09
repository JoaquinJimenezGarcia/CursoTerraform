variable "image_names" {
  description = "Docker images to pull"
  type        = list(string)
}

variable "total_containers" {
  description = "Total number of containers to deploy"
  type = number
}

variable "container_base_name" {
  description = "Container name for our service"
  type = string
}

variable "internal_port" {
  description = "Internal port to be used by our container"
  type = number
  default = 80
}

variable "external_port" {
  description = "External port to be used by our container"
  type = number
  default = 40
}

variable "docker_networks" {
  description = "Networks to be created for Docker"
  type = list(map(string))
}