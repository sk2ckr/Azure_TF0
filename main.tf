# Configure the Azure provider
provider "azurerm" { 
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
}

resource "azurerm_app_service_plan" "testAppServicePlan" {
    name                = "07531-slotAppServicePlan"
    location            = var.location
    resource_group_name = var.resource_group_name
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "testAppService" {
    name                = "07531-slotAppService"
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.testAppServicePlan.id
}

resource "azurerm_app_service_slot" "slotDemo" {
    name                = "07531-slotAppServiceSlotOne"
    location            = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.testAppServicePlan.id
    app_service_name    = azurerm_app_service.testAppService.name
}