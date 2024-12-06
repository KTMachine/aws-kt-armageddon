data "aws_subnets" "australia" {
  tags = {
    Name  = "Australia subnet"
  }
depends_on = [aws_subnet._1]
  
}
    

resource "aws_lb" "australia_alb" {
  provider = aws.australia
  name               = "australia-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group._1["australia-sg-server"].id]
  subnets            = data.aws_subnets.australia.ids
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "AustraliaLoadBalancer"
    Service = "App1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "australia_http" {
  load_balancer_arn = aws_lb.australia_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.australia-tg.arn
  }
}

# data "aws_acm_certificate" "cert" {
#   domain   = "balerica-aisecops.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.australia_alb.arn
  port              = 80
  protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.australia-tg.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.australia_alb.dns_name
  description = "The DNS name of the Australia Load Balancer."
}