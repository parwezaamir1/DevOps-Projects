terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.34.0"
    }
  }
}

provider "github" {
  token = "${var.token}"
}