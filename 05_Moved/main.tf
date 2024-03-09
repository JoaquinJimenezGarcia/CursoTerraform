provider "local" {}

moved {
  from = local_file.mi_fichero
  to = module.fichero_modularizado.local_file.mi_fichero
}

module "fichero_modularizado" {
  source = "./local"
}