variable "setup" {
  type = map(string)
  default = {
    tokyo      = "ap-northeast-1"
    new-york   = "us-east-1"
    london     = "eu-west-2"
    sao-paulo  = "sa-east-1"
    australia  = "ap-southeast-2"
    hong-kong  = "ap-southeast-1"
    california = "us-west-1"
  }
}

variable "vpcs" {
  type = map(map(string))
  default = {
    tokyo = {                   #each.key
      region = "ap-northeast-1" #each.value.region
      cidr   = "10.40.0.0/16"
      name   = "tokyo"
    }
    tokyo-test = {
      region = "ap-northeast-1"
      cidr   = "10.47.0.0/16"
      name   = "tokyo-test"
    }
    new-york = {
      region = "us-east-1"
      cidr   = "10.41.0.0/16"
      name   = "new-york"
    }
    london = {
      region = "eu-west-2"
      cidr   = "10.42.0.0/16"
      name   = "london"
    }
    sao-paulo = {
      region = "sa-east-1"
      cidr   = "10.43.0.0/16"
      name   = "sao-paulo"
    }
    australia = {
      region = "ap-southeast-2"
      cidr   = "10.44.0.0/16"
      name   = "australia"
    }
    hong-kong = {
      region = "ap-southeast-1"
      cidr   = "10.45.0.0/16"
      name   = "hong-kong"
    }
    california = {
      region = "us-west-1"
      cidr   = "10.46.0.0/16"
      name   = "california"
    }
  }
}


variable "tokyo-subnets" {
  type = map(map(string))
  default = {
    tokyo-a-public = {
      vpc  = "tokyo"
      cidr = "10.40.1.0/24"
      az   = "ap-northeast-1a"
    }
    tokyo-d-public = {
      vpc  = "tokyo"
      cidr = "10.40.4.0/24"
      az   = "ap-northeast-1d"
    }
    tokyo-a-private = {
      vpc  = "tokyo"
      cidr = "10.40.11.0/24"
      az   = "ap-northeast-1a"
    }
    # tokyo-d-private = {
    #   vpc  = "tokyo"
    #   cidr = "10.40.14.0/24"
    #   az   = "ap-northeast-1d"
    # }
    tokyotest-c-public = {
      vpc  = "tokyo-test"
      cidr = "10.40.2.0/24"
      az   = "ap-northeast-1c"
    }
  }
}

# grab the var.tokyo-subnets and create a new map with the keys that include private
locals {
  tokyo-nat = { for k, v in var.tokyo-subnets : k => v if can(regex("private", k)) }
}


variable "london-subnets" {
  type = map(map(string))
  default = {
    london-a-public = {
      vpc  = "london"
      cidr = "10.42.1.0/24"
      az   = "eu-west-2a"
    }
    london-b-public = {
      vpc  = "london"
      cidr = "10.42.2.0/24"
      az   = "eu-west-2b"
    }
  }
}

# aws_vpc.australia-vpc
# aws_vpc.california-vpc
# aws_vpc.hong-kong-vpc
# aws_vpc.london-vpc
# aws_vpc.new-york-vpc
# aws_vpc.sao-paulo-vpc
# aws_vpc.tokyo-vpc

variable "sao-paulo-subnets" {
  type = map(map(string))
  default = {
    sao-paulo-a-public = {
      vpc  = "sao-paulo"
      cidr = "10.43.1.0/24"
      az   = "sa-east-1a"
    }
    sao-paulo-c-public = {
      vpc  = "sao-paulo"
      cidr = "10.43.3.0/24"
      az   = "sa-east-1c"
    }
  }
}

variable "australia-subnets" {
  type = map(map(string))
  default = {
    australia-a-public = {
      vpc  = "australia"
      cidr = "10.44.1.0/24"
      az   = "ap-southeast-2a"
    }
    australia-b-public = {
      vpc  = "australia"
      cidr = "10.44.2.0/24"
      az   = "ap-southeast-2b"
    }
  }
}

variable "hong-kong-subnets" {
  type = map(map(string))
  default = {
    hong-kong-a-public = {
      vpc  = "hong-kong"
      cidr = "10.45.1.0/24"
      az   = "ap-southeast-1a"
    }
    hong-kong-b-public = {
      vpc  = "hong-kong"
      cidr = "10.45.2.0/24"
      az   = "ap-southeast-1b"
    }
  }
}

variable "california-subnets" {
  type = map(map(string))
  default = {
    california-b-public = {
      vpc  = "california"
      cidr = "10.46.2.0/24"
      az   = "us-west-1b"
    }
    california-c-public = {
      vpc  = "california"
      cidr = "10.46.3.0/24"
      az   = "us-west-1c"
    }
  }
}

variable "new-york-subnets" {
  type = map(map(string))
  default = {
    new-york-a-public = {
      vpc  = "new-york"
      cidr = "10.41.1.0/24"
      az   = "us-east-1a"
    }
    new-york-b-public = {
      vpc  = "new-york"
      cidr = "10.41.2.0/24"
      az   = "us-east-1b"
    }
  }
}

variable "route-table-cidr" {
  type = string
  default = "0.0.0.0/0"
}