resource "virtualbox_vm" "vm1" {
  name   = "debian-11"
  image  = "https://app.vagrantup.com/shekeriev/boxes/debian-11/versions/0.2/providers/virtualbox.box"
  cpus   = 1
  memory    = "512 mib"

  network_adapter {
    type           = "hostonly"
    device         = "IntelPro1000MTDesktop"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}