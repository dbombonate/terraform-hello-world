terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "k8s-desafio-aula3" {
  name   = var.k8s_name
  region = var.region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.8-do.1"

  node_pool {
    name       = "desafio-aula3"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}

variable "do_token" {}
variable "k8s_name" {}
variable "region" {}


resource "local_file" "kube_config" {
  content  = digitalocean_kubernetes_cluster.k8s-desafio-aula3.kube_config.0.raw_config
  filename = "kube_config.yaml"
}
