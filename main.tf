module "cockpit" {
  source = "./cockpit"

  providers = {
    system = system
  }
}

module "docker" {
  source = "./docker"

  system_user = var.system_user

  providers = {
    linux = linux
  }
}

module "kubernetes" {
  source = "./kubernetes"

  system_host = var.system_host
  system_user = var.system_user

  providers = {
    linux = linux
  }

  depends_on = [module.docker]
}

module "kubernetes_services" {
  source = "./kubernetes_services"

  providers = {
    kubernetes = kubernetes
    kubectl    = kubectl
    helm       = helm
  }

  depends_on = [module.kubernetes]
}