variable "nics" {}

data "azurerm_subnet" "subnets" {
    for_each = var.nics
  name = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name = each.value.rg_name
}

data "azurerm_public_ip" "pips" {
    for_each = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_network_interface" "nics" {
    for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.nics
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = "Standard_D4_v5"
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}