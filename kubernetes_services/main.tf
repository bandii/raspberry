module "portainer" {
  source = "./services/portainer"

  providers = {
    kubectl = kubectl
    helm    = helm
  }
}
