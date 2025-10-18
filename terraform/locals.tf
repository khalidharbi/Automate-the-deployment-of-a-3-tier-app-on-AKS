locals {
  resource_group_name = "khalid-rg"
  vnet_name           = "k"
  location            = "UAE North"

  tags = {
    bootcamp = "devops-group2"
  }

  address_space = ["10.0.0.0/16"]

  subnet = {
    db_subnet = {
      address_space = ["10.0.0.0/24"]
    }
    aks_subnet = {
      address_space = ["10.0.2.0/23"]
    }
  }

  sql = {
    db_name        = "khalid"
    admin_user     = "sqladmin"
    admin_password = "StrongP@ssw0rd123!"
    db_port        = 1433
  }
}
