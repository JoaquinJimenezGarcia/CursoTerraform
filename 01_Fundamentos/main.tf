provider "local" {}

resource "local_file" "mi_fichero" {
  filename = var.file_name
  content  = "Esto es un fichero de texto nuevo"
}