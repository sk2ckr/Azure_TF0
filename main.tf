# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

# Create a resource group
/*
resource "azurerm_resource_group" "resource_group" {
    name                = "skt-dev-kc-tsop-rg" # skt-dev-kc-tsop-rg
    location            = var.LOCATION

    tags = {
        environment = var.TAGS_ENV
    }
}
*/

module "vnet" {
    source                      = "./modules/vnet" 
    
    TAGS_ENV                    = var.TAGS_ENV
    NAME_PREFIX                 = var.NAME_PREFIX
    CLIENT_VNET                 = var.CLIENT_VNET
    LOCATION                    = var.LOCATION
    RESOURCE_GROUP_NAME         = var.RESOURCE_GROUP_NAME
}
