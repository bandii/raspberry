﻿terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.24.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "kubernetes" {
  config_path = "../kubernetes/kubeconfig.yaml"
}

provider "helm" {
  config_path = "../kubernetes/kubeconfig.yaml"
}