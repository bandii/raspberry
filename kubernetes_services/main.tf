resource "helm_release" "portainer" {
  name             = "portainer"
  namespace        = "portainer"
  create_namespace = true

  repository = "https://portainer.github.io/k8s/"
  chart      = "portainer"
}