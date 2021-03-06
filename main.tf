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
    TSOP_NAME_PREFIX            = var.TSOP_NAME_PREFIX
    ONM_NAME_PREFIX             = var.ONM_NAME_PREFIX
    LOCATION                    = var.LOCATION
    RESOURCE_GROUP_NAME         = var.RESOURCE_GROUP_NAME

    TSOP_VNET                   = var.TSOP_VNET
    ONM_VNET                    = var.ONM_VNET
}

module "appservice" {

    source                      = "./modules/appservice"

    TAGS_ENV                    = var.TAGS_ENV
    TSOP_NAME_PREFIX            = var.TSOP_NAME_PREFIX
    ONM_NAME_PREFIX             = var.ONM_NAME_PREFIX
    LOCATION                    = var.LOCATION
    RESOURCE_GROUP_NAME         = var.RESOURCE_GROUP_NAME
    
    TSOP_APPSERVICE             = var.TSOP_APPSERVICE
    ONM_APPSERVICE              = var.ONM_APPSERVICE
}