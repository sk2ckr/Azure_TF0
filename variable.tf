variable "TAGS_ENV" {
    default = "Terraform Test"
}

# 실제 적용 시 skt-dev-kc-tsop-rg로 적용
variable "RESOURCE_GROUP_NAME" {
#    default = "skt-dev-kc-tsop-rg"
    default = "07531"
}

# 실제 적용 시 skt-dev-kc로 적용
variable "NAME_PREFIX" {
#    default = "skt-dev-kc"
    default = "07531"
}

variable "ONM_VNET" {
    default = "10.12"
}

variable "TSOP_VNET" {
    default = "10.13"
}

variable "LOCATION" {
    default = "Korea Central"
}

variable "USER_NAME" {
    default = "skttsopadmin"
}

variable "USER_PASSWORD" {
    default = "test1234$#@!"
}

variable "REGISTRIES_EDGEACR_NAME" {
    default = "edgeacr"
}

variable "STORAGEACCOUNTS_ADLSSA_NAMES" {
    default = ["adlssa", "capturesa"]
}

variable "CONTAINER_ADLS_NAMES" {
    default = ["file", "image", "video", "checkpoint"]
}

variable "CONTAINER_CAPTURE_NAME" {
    default = "capture"
}

variable "IOTHUBS_EDGE_IHB_NAME" {
    default = "edge-ihb"
}

variable "NAMESPACES_UPLINK_EHB_NAME" {
    default = "uplink-ehb"
}

variable "HUBS_UPLINE_NAMES" {
    default = ["uplink-fast", "uplink-normal"]
}

variable "PLANINFO_NAME" {
    default = "tsop"
}

variable "PLANINFO_SKU" {
    default = "P3v2"
}

variable "PLANINFO_CAPACITY" {
    default = 1
}

variable "TSOP_APPSERVICE" {
#    default = ["fm", "ev", "cctv", "acaas", "parking",
#                "robot", "vps", "chatbot", "public", "analytics",
#                "normal", "fast", "backend", "portal", "dashboard",
#                "push", "batch", "downlink"]
    default = ["fm", "ev", "cctv"]
}

/*
variable "APP_SERVICE_NUMBER" {
	default = ["1", "2"]
}
*/