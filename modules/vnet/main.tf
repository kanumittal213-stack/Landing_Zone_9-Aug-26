variable "vnets" {}

resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets
  name = each.value.vnet_name
  resource_group_name = each.value.vnet_name
  location = each.value.location
  address_space = each.value.address_space
}