terraform {
  required_version = ">=0.15"

  backend "gcs" {
    prefix = "helloworld-infra"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.12.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.12.0"
    }
  }
}

provider "google" {
  region  = "europe-north1"
  project = "coin-tracker-381614"
}
