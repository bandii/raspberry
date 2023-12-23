resource "linux_script" "prereqs" {
  lifecycle_commands {
    create = "sudo curl -sSL https://get.docker.com | sh"
    read   = "echo done"
    delete = join(" && ", [
      "sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras",
      "sudo rm -rf /var/lib/docker",
      "sudo rm -rf /var/lib/containerd"
    ])
  }
}

resource "linux_script" "assign_user_to_docker_group" {
  lifecycle_commands {
    create = "sudo usermod -aG docker ${var.system_user}"
    read   = "echo done"
    delete = "gpasswd -d user docker"
  }

  depends_on = [
    linux_script.prereqs
  ]
}