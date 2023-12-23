#resource "linux_script" "k3s_set_cgroup" {
#  lifecycle_commands {
#    create = "echo \" cgroup_memory=1 cgroup_enable=memory\" | sudo tee -a filename >/boot/cmdline.txt"
#    read   = "echo done"
#    delete = "sudo /usr/local/bin/k3s-uninstall.sh"
#  }
#}

# TODO: cgroup settings needs to be modified, so k3s can work without restarting the whole Rasp

resource "linux_script" "k3s_download" {
  lifecycle_commands {
    create = "curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644"
    read   = "echo done"
    delete = "sudo /usr/local/bin/k3s-uninstall.sh"
  }
  
#  depends_on = [
#    linux_script.k3s_set_cgroup
#  ]
}

resource "linux_script" "k3s_set_kubeconfig" {
  lifecycle_commands {
    create = "sudo kubectl --kubeconfig=/etc/rancher/k3s/k3s.yaml get nodes"
    read   = "sudo cat /etc/rancher/k3s/k3s.yaml"
    delete = "echo done"
  }
  
  depends_on = [
    linux_script.k3s_download
  ]
}

resource "local_file" "save_config_to_local" {
  content  = linux_script.k3s_set_kubeconfig.output
  filename = "${path.module}/kubeconfig.yaml"
  
  depends_on = [
    linux_script.k3s_set_kubeconfig
  ]
}

resource "linux_script" "arkade" {
  lifecycle_commands {
    create = "curl -sLS https://get.arkade.dev | sudo sh"
    read   = "arkade version"
    delete = "echo done"
  }

  depends_on = [
    local_file.save_config_to_local
  ]
}