terraform {
  cloud {

    organization = "yyev89"

    workspaces {
      name = "homelab"
    }
  }
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "monitoring" {
  source        = "./modules/monitoring"
  chart_version = "47.0.0"
}
