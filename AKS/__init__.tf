terraform {
  required_version = ">= 0.11.10"
  backend "azurerm" {
    storage_account_name = "cadtdpsa"
    container_name       = "tf-cad-state"
    key                  = "terraform.tfstate"
    access_key = "uX3iGf5ahKsS3scpVkVRJ2n1l8N98MGOWvvSKOaVLUctXLwxVJ5XEww/NxZYC7GfetMmb49PDOcM8AtVOu5SQg=="
  }
}