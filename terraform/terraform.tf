terraform {
  required_version = ">= 0.14.2"
  backend "s3" {
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = "true"
  }
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = ">= 0.12.6"
    }
    statuscake = {
      source  = "terraform-providers/statuscake"
      version = "~> 1.0.0"
    }
  }
}

provider cloudfoundry {
  api_url           = local.paas_api_url
  user              = var.paas_username
  password          = var.paas_password
  sso_passcode      = var.paas_sso_passcode
  store_tokens_path = "./paas-tokens"
}

provider statuscake {
  username = var.statuscake_username
  apikey   = var.statuscake_apikey
}
