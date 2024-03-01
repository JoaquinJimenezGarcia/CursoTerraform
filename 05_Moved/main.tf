provider "local" {}

resource "local_file" "mi_fichero" {
  filename = "MyFile"
  content  = "Content of my file"
}