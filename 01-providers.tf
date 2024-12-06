
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}
# - Tokyo.
# - New York
# - London
# - Sao Paulo
# - Australia 
# - Hong Kong
# - California

provider "aws" {
  # Configuration options
  region = var.setup.new-york
  alias  = "new-york"
}
provider "aws" {
  # Configuration options
  region = var.setup.tokyo
  alias  = "tokyo"
}

provider "aws" {
  # Configuration options
  region = var.setup.london
  alias  = "london"
}

provider "aws" {
  # Configuration options
  region = var.setup.sao-paulo
  alias  = "sao-paulo"
}

provider "aws" {
  # Configuration options
  region = var.setup.australia
  alias  = "australia"
}

provider "aws" {
  # Configuration options
  region = var.setup.hong-kong
  alias  = "hong-kong"
}

provider "aws" {
  # Configuration options
  region = var.setup.california
  alias  = "california"
}