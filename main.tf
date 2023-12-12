module "vpc" {
  source   = "git::https://github.com/SPOORNACHANDRA/tf-module-vpc.git"
  for_each = var.vpc      #this is for how many times i have to iterate
  cidr = each.value["cidr"]   # this cidr whole value is sending to tf-module-vpc
  subnets = each.value["subnets"] # this subnets whole value is sending to tf-module-vpc
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_vpc_route_table_id = var.default_vpc_route_table_id
  tags = var.tags
  env=var.env
}


module "alb" {
  source   = "git::https://github.com/SPOORNACHANDRA/tf-module-alb.git"

  for_each = var.alb
  internal = each.value["internal"]
  lb_type = each.value["lb_type"]
  sg_ingress_cidr = each.value["sg_ingress_cidr"]
  vpc_id = each.value["internal"] ? : var.default_vpc_id
  tags = var.tags
  env=var.env
}









output "vpc" {            #this is printing
  value = module.vpc
}
