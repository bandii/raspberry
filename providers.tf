﻿terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
    system = {
      source  = "neuspaces/system"
      version = "0.4.0"
    }
    linux = {
      source  = "TelkomIndonesia/linux"
      version = "0.7.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.24.0"
    }
    kubectl = {
      source  = "froberg-co/kubectl"
      version = "2.0.4"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "system" {
  ssh {
    host     = var.system_host
    user     = var.system_user
    password = var.system_password
  }

  sudo = true
}

provider "linux" {
  host     = var.system_host
  user     = var.system_user
  password = var.system_password
}

provider "local" {
}

provider "kubernetes" {
  config_path = "./kubernetes/kubeconfig.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "./kubernetes/kubeconfig.yaml"
  }
}

provider "kubectl" {
  host             = var.system_host
  config_path      = "./kubernetes/kubeconfig.yaml"
  load_config_file = true
}