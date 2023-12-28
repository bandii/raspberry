resource "helm_release" "portainer" {
  name              = "portainer"
  namespace         = "portainer"
  create_namespace  = true
  dependency_update = true

  repository = "https://portainer.github.io/k8s"
  chart      = "portainer"
}

data "kubectl_path_documents" "portainer_traefik" {
  pattern = "./*.yaml"
}

resource "kubectl_manifest" "test" {
  for_each  = data.kubectl_path_documents.portainer_traefik.manifests
  yaml_body = each.value
}