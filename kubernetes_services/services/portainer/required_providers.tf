terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    kubectl = {
      source  = "froberg-co/kubectl"
      version = "2.0.4"
    }
  }
}