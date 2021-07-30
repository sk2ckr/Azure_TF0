# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}
/*
locals {
  app_service_count = length(var.APP_SERVICE_NUMBER)
}

resource "azurerm_app_service_plan" "AppServicePlan" {
    name                = "${var.PREFIX}-AppServicePlan"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appservices" {
    count               = local.app_service_count
    name                = "${var.PREFIX}-AppService-${var.APP_SERVICE_NUMBER[count.index]}"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.AppServicePlan.id
}

resource "azurerm_app_service_slot" "appservicesSlot" {
    count               = local.app_service_count
    name                = "${var.PREFIX}-AppServiceSlot-${var.APP_SERVICE_NUMBER[count.index]}"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.AppServicePlan.id
    app_service_name    = azurerm_app_service.appservices[count.index].name
}
*/
/*
module "webapp" {
    
    source                      = "./modules/webapp" 
    
    AWS_REGION                  = var.AWS_REGION
    VPC_CIDR                    = var.VPC_CIDR
    FRONTEND_SUBNET_COUNT       = var.FRONTEND_SUBNET_COUNT
    BACKEND_SUBNET_COUNT        = var.BACKEND_SUBNET_COUNT
    ENABLE_BACKEND_SUBNET       = var.ENABLE_BACKEND_SUBNET
    USER_ID                     = var.USER_ID

    #VPC-Peer할 때만 활성화 할 것
    PEER_CIDR                   = var.PEER_VPC_CIDR
    PEER_ID                     = var.PEER_ID
}
*/
module "nsg_policy" {
    
    source                      = "./modules/nsg_policy" 
    
    VPC_ID                      = module.vpc.id
    WEB_SERVICE_PORTS           = var.WEB_SERVICE_PORTS #80,8080
    SSH_ACCESS_HOST             = var.SSH_ACCESS_HOST
    PEER_CIDR                   = var.PEER_VPC_CIDR
    USER_ID                     = var.USER_ID
}
