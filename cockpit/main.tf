resource "system_packages_apt" "cockpit" {
  package {
    name = "cockpit"
  }
}

# TODO: add plugins with https://registry.terraform.io/providers/TelkomIndonesia/linux/latest/docs/resources/script