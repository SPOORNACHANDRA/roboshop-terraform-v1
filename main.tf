module "vpc" {
  source   = "git::https://github.com/SPOORNACHANDRA/tf-module-vpc.git"
  for_each = var.vpc      #this is for how many times i have to iterate
  cidr = each.value["cidr"]   # this cidr whole value is sending to tf-module-vpc
  subnets = each.value["subnets"] # this subnets whole value is sending to tf-module-vpc
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_vpc_route_table_id = var.default_vpc_route_table_id
}


output "vpc" {            #this is printing
  value = module.vpc
}
