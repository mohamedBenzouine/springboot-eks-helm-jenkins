terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.30.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.1"
    }
  }
}
