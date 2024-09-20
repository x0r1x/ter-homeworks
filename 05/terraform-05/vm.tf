module "marketing_vm" {
  source         = "git::https://github.com/x0r1x/yandex_compute_instance.git?ref=53e69d2d3698c33e33df79c55ca57a805c20c2a5"
  env_name       = var.vms.marketing.env_name
  network_id     = module.vpc_dev.vpc_network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = module.vpc_dev.vpc_netwrok_subnets_id
  security_group_ids = [yandex_vpc_security_group.sec_grp.id]
  instance_name  = var.vms.marketing.instance_name
  instance_count = var.vms.marketing.instance_count
  image_family   = var.vms.marketing.image_family
  public_ip      = var.vms.marketing.public_ip 

  labels = { 
    project = var.vms.marketing.env_name
  }

  metadata = {
    user-data          = local.cloudinit
  }

}

module "analytic_vm" {
  source         = "git::https://github.com/x0r1x/yandex_compute_instance.git?ref=53e69d2d3698c33e33df79c55ca57a805c20c2a5"
  env_name       = var.vms.analytic.env_name
  network_id     = module.vpc_dev.vpc_network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = module.vpc_dev.vpc_netwrok_subnets_id
  security_group_ids = [yandex_vpc_security_group.sec_grp.id]
  instance_name  = var.vms.analytic.instance_name
  instance_count = var.vms.analytic.instance_count
  image_family   = var.vms.analytic.image_family
  public_ip      = var.vms.analytic.public_ip

  labels = { 
    project = var.vms.analytic.env_name
  }

  metadata = {
    user-data          = local.cloudinit
  }

}
