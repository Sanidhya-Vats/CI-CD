
module "module-rg" {
  source = "../../modules/azurerm-rgs"
  rgs    = var.dev-rgs
}

# module "module-stgs" {
#   depends_on = [module.module-rg]
#   source     = "../../modules/azurerm-stgs"
#   stgs       = var.dev-stgs
# }

# module "module-cons" {
#   depends_on = [module.module-stgs]
#   source     = "../../modules/azurerm-con"
#   cons       = var.dev-cons
# }

module "module-vnets" {
  depends_on = [module.module-nsgs]
  source     = "../../modules/azurerm-vnets"
  vnets      = var.dev-vnets

}
module "module-nsgs" {
  depends_on = [module.module-rg]
  source     = "../../modules/azurerm-nsgs"
  nsgs       = var.dev-nsgs
}
# module "module-asgs" {
#   depends_on = [ module.module-rg ]
#   source = "../../modules/azurerm-asgs"
#   asgs = var.dev-asgs
# }
# module "module-win-vms" {

#   depends_on = [ module.module-vnets,module.module-keyvaults ] #module.var.dev-asgs 
#   source = "../../modules/azurerm-win-vms"
#   window-vms = var.dev-win-vms
# }
module "module-bastions" {
  depends_on = [module.module-vnets]
  source     = "../../modules/azurerm-bastions"
  bastions   = var.dev-bastions
}
module "module-keyvaults" {
  depends_on = [module.module-rg]
  source     = "../../modules/azurerm-keyvault"
  keyvaults  = var.dev-keyvaults
}

module "module-linux-vms" {

  depends_on = [module.module-vnets, module.module-keyvaults] #module.var.dev-asgs 
  source     = "../../modules/azurerm-linux-vms"
  linux-vms  = var.dev-linux-vms
}