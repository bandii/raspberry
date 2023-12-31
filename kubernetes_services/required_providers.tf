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
    kubectl = {
      source  = "froberg-co/kubectl"
      version = "2.0.4"
    }
  }
}