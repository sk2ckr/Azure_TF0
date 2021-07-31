# Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.NAME_PREFIX}-tsop-vnet"
    address_space       = ["${var.CLIENT_VNET}.0.0/16"]
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME

    tags = {
        environment = var.TAGS_ENV
    }
}

/*
# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = "mySubnet"
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}
*/