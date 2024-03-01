provider "local" {}
provider "random" {}

resource "random_string" "file_content" {
  length = 8
}

resource "random_integer" "file_name" {
  keepers = {
    first = "${timestamp()}"
  }
  min = 1
  max = 6
}


resource "local_file" "mi_fichero" {
  filename = random_integer.file_name.result
  content  = random_string.file_content.result
}