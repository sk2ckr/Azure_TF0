locals {
  appservice_count = length(var.TSOP_APPSERVICE)
}

resource "azurerm_app_service_plan" "tsop_appserviceplan" {
    name                = "${var.NAME_PREFIX}-tsop-plan"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    sku {
        tier = "Standard"
        size = "S1"
    }

    tags = {
        environment     = var.TAGS_ENV
    }
}

resource "azurerm_app_service" "tsop_appservice" {
    count               = local.appservice_count
    
    name                = "${var.NAME_PREFIX}-${var.TSOP_APPSERVICE[count.index]}"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.tsop_appserviceplan.id

    tags = {
        environment     = var.TAGS_ENV
    }
}

resource "azurerm_app_service_slot" "tsop_appserviceslot" {
    count               = local.appservice_count

    name                = "slot"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.tsop_appserviceplan.id
    app_service_name    = azurerm_app_service.tsop_appservice[count.index].name

    tags = {
        environment     = var.TAGS_ENV
    }
}
