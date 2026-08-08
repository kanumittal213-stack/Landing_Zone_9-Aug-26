module "rgs" {
  source = "../../modules/resource group"
  rgs    = var.rgs

}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../../modules/vnet"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.vnets]
  source     = "../../modules/subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rgs]
  source     = "../../modules/public ip"
  pips       = var.pips
}

module "nics" {
  depends_on = [module.pips, module.subnets]
  source     = "../../modules/virtual machine"
  nics       = var.nics
}