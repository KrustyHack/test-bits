terraform {
  backend "remote" {
    organization = "blackcreeper-network"

    workspaces {
      name = "test-bit-gcp"
    }
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.4"
    }
  }
}

provider "google" {
  project = "test-bits-335214"
  region  = local.region
}

provider "google-beta" {
  project = "test-bits-335214"
  region  = local.region
}
