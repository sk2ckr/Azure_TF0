# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

locals {
  app_service_count = length(var.APP_SERVICE_NUMBER)
}

resource "azurerm_app_service_plan" "AppServicePlan" {
    name                = "07531-AppServicePlan"
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