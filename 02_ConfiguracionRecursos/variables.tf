variable "image_name" {
  description = "Docker image to pull"
  type        = string
}

variable "container_name" {
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