# Image vars
image_names = ["nginx:latest", "httpd:latest"]

# Container vars
total_containers = 2
container_base_name = "CloudArch"
internal_port = 8080
docker_networks = [
    {
        "name" = "LoadBalancer",
        "driver" = "bridge",
        "ingress" = false,
        "internal" = true
    },
    {
        "name" = "InternalNetwork",
        "driver" = "bridge",
        "ingress" = false,
        "internal" = true
    }
]