variable "docker_networks" {
  description = "Networks to be created for Docker"
  type = list(map(string))
}