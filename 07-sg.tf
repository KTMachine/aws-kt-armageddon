locals {
  security-groups = { for k, v in var.vpcs : k => { "${k}-sg-server" = { ssh-port = "22", cidr = "0.0.0.0/0", protocol = "tcp" }, "${k}-sg-lb" = { sg-name = "${k}-sg-lb" } } }
  sg = {
    http-port       = 80
    ssh-port        = 22
    protocol        = "TCP"
    cidr            = "0.0.0.0/0"
    egress-port     = 0
    egress-protocol = "-1"
    description     = "Allow inbound traffic from the internet"
  }
}

resource "aws_security_group" "_1" {
  for_each    = local.security-groups.australia
  vpc_id      = aws_vpc.australia-vpc.id
  provider    = aws.australia
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_2" {
  for_each    = local.security-groups.california
  vpc_id      = aws_vpc.california-vpc.id
  provider    = aws.california
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_3" {
  for_each    = local.security-groups.hong-kong
  vpc_id      = aws_vpc.hong-kong-vpc.id
  provider    = aws.hong-kong
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_4" {
  for_each    = local.security-groups.london
  vpc_id      = aws_vpc.london-vpc.id
  provider    = aws.london
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_5" {
  for_each    = local.security-groups.new-york
  vpc_id      = aws_vpc.new-york-vpc.id
  provider    = aws.new-york
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_6" {
  for_each    = local.security-groups.sao-paulo
  vpc_id      = aws_vpc.sao-paulo-vpc.id
  provider    = aws.sao-paulo
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "_7" {
  for_each    = local.security-groups.tokyo
  vpc_id      = aws_vpc.tokyo-vpc.id
  provider    = aws.tokyo
  name        = each.key
  description = local.sg.description

  # http ingress
  ingress {
    from_port   = local.sg.http-port
    to_port     = local.sg.http-port
    protocol    = local.sg.protocol
    cidr_blocks = [local.sg.cidr]
  }
  # dynamic ssh ingress
  dynamic "ingress" {
    for_each = endswith(each.key, "server") ? [1] : []
    content {
      from_port   = each.value.ssh-port
      to_port     = each.value.ssh-port
      protocol    = each.value.protocol
      cidr_blocks = [each.value.cidr]
    }
  }

  egress {
    from_port   = local.sg.egress-port
    to_port     = local.sg.egress-port
    protocol    = local.sg.egress-protocol
    cidr_blocks = [local.sg.cidr]
  }

  tags = {
    Name = each.key
  }
}