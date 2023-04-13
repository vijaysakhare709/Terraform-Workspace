
# Creating azure resource group

resource "azurerm_resource_group" "vijay" {
  name     = "${terraform.workspace}-RG"
  location = "West Europe"
  tags = {
    environement = "dev"
  }
}

# creating virtual network (Vnet) 

resource "azurerm_virtual_network" "virtualnetwork" {
  name                = "${terraform.workspace}virtualnetwork"
  resource_group_name = "${azurerm_resource_group.vijay.name}"
  location            = "${azurerm_resource_group.vijay.location}"
  address_space       =   ["10.0.0.0/16"]

  tags = {
    environement = "dev"
  }
}

# Creating multipal subnet in vnet (type = list)

resource "azurerm_subnet" "virtualsubnet1" {
  name                 = "${terraform.workspace}subnetA"
  resource_group_name  = "${azurerm_resource_group.vijay.name}"
  virtual_network_name = "${azurerm_virtual_network.virtualnetwork.name}"
  address_prefixes     = ["10.0.1.0/24"]

}

