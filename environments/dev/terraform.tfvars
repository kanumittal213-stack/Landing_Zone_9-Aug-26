rgs = {
  rg1 = {
    rg_name  = "corp_devlopment"
    location = "west europe"
  }

}

vnets = {
  vnet1 = {
    vnet_name     = "corp_dev_vnet"
    rg_name       = "corp_dev"
    location      = "west europe"
    address_space = ["10.75.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name    = "frontend_subnet"
    vnet_name      = "corp_dev_vnet"
    rg_name        = "Corp_dev"
    address_prefix = ["10.75.1.0/24"]
  }
  subnet2 = {
    subnet_name    = "backend_subnet"
    vnet_name      = "corp_dev_vnet"
    rg_name        = "Corp_dev"
    address_prefix = ["10.75.2.0/24"]
  }
}

pips = {
  pip1 = {
    pip_name          = "Corp_dev_fe_pip"
    rg_name           = "corp_dev"
    location          = "West europe"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "Corp_dev_be_pip"
    rg_name           = "corp_dev"
    location          = "West europe"
    allocation_method = "Static"
  }
}

nics = {
  nic1 = {
    nic_name       = "corp_dev_fe_nic"
    location       = "west europe"
    rg_name        = "corp_dev"
    ip_config_name = "corp_dev_ip_config"
    vnet_name      = "corp_dev_vnet"
    pip_name       = "corp_dev_fe_pip"
    subnet_name    = "frontend_subnet"
    vm_name        = "frontend_vm"
    rg_name        = "corp_dev"
    location       = "west europe"
    admin_username = "adminuser"
    admin_password = "@9540174129aK"
  }

  nic2 = {
    nic_name       = "corp_dev_be_nic"
    location       = "west europe"
    rg_name        = "corp_dev"
    ip_config_name = "corp_dev_ip_config"
    vnet_name      = "corp_dev_vnet"
    pip_name       = "corp_dev_be_pip"
    subnet_name    = "backend_subnet"
    vm_name        = "backend_vm"
    rg_name        = "corp_dev"
    location       = "west europe"
    admin_username = "adminuser"
    admin_password = "@9540174129aK"
  }
}