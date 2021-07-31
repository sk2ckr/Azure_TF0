locals {
  appservice_count = length(var.TSOP_APPSERVICE)
}

resource "azurerm_app_service_plan" "AppServicePlan" {
    name                = "${var.NAME_PREFIX}-AppServicePlan"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "appservices" {
    count               = local.appservice_count
    name                = "${var.NAME_PREFIX}-AppService-${var.TSOP_APPSERVICE[count.index]}"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.AppServicePlan.id
}

resource "azurerm_app_service_slot" "appservicesSlot" {
    count               = local.appservice_count
    name                = "slot"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.AppServicePlan.id
    app_service_name    = azurerm_app_service.appservices[count.index].name
}
