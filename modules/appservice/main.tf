locals {
  tsop_appservice_count = length(var.TSOP_APPSERVICE)
  onm_appservice_count = length(var.ONM_APPSERVICE)
}

# TSOP Appservice Create
resource "azurerm_app_service_plan" "tsop_appserviceplan" {
    name                = "${var.TSOP_NAME_PREFIX}-tsop-plan"
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
    count               = local.tsop_appservice_count

    name                = "${var.TSOP_NAME_PREFIX}-${var.TSOP_APPSERVICE[count.index]}-app"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.tsop_appserviceplan.id

    tags = {
        environment     = var.TAGS_ENV
    }
}

resource "azurerm_app_service_slot" "tsop_appserviceslot" {
    count               = local.tsop_appservice_count

    name                = "slot"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.tsop_appserviceplan.id
    app_service_name    = azurerm_app_service.tsop_appservice[count.index].name

    tags = {
        environment     = var.TAGS_ENV
    }
}

# ONM Appservice Create
resource "azurerm_app_service_plan" "onm_appserviceplan" {
    name                = "${var.ONM_NAME_PREFIX}-onm-plan"
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

resource "azurerm_app_service" "onm_appservice" {
    count               = local.onm_appservice_count

    name                = "${var.ONM_NAME_PREFIX}-${var.ONM_APPSERVICE[count.index]}-app"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.onm_appserviceplan.id

    tags = {
        environment     = var.TAGS_ENV
    }
}

resource "azurerm_app_service_slot" "onm_appserviceslot" {
    count               = local.onm_appservice_count

    name                = "slot"
    location            = var.LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME
    app_service_plan_id = azurerm_app_service_plan.onm_appserviceplan.id
    app_service_name    = azurerm_app_service.onm_appservice[count.index].name

    tags = {
        environment     = var.TAGS_ENV
    }
}
