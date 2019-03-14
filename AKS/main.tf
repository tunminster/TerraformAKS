// Resource Group
resource "azurerm_resource_group" "k8s-rg" {
  name     = "${var.RESOURCE_GROUP}"
  location = "${var.LOCATION}"

  tags {
    environment = "${terraform.workspace}"
    creator     = "${var.CREATOR}"
  }
}
// Azure Kubernetes Service
module "azure-kubernetes-service" {
  source = "./Modules/AKS"
  version = "${var.MODULE_VERSION}"

  name                = "${var.KUBERNETES_CLUSTER_NAME}" 
  location            = "${azurerm_resource_group.k8s-rg.location}"
  resource_group_name = "${azurerm_resource_group.k8s-rg.name}"                                   
  dns_prefix          = "${var.DNS_PREFIX}"        
  admin_user          = "${var.ADMIN_USER}"
  ssh_key             = "${var.SSH_KEY}" 
  agent_pool_name     = "${var.AGENT_POOL_NAME}"
  agent_count         = "${var.KUBERNETES_AGENT_COUNT}"
  vm_size             = "${var.KUBERNETES_VM_SIZE}"
  os_type             = "${var.OS_TYPE}"
  os_disk_size_gb     = "${var.OS_DISK_SIZE_GB}"
  vnet_subnet_id      = "/subscriptions/${var.NETWORKING_VNET_SUBSCRIPTION}/resourceGroups/${var.NETWORKING_VNET_RESOURCE_GROUP}/providers/Microsoft.Network/virtualNetworks/${var.NETWORKING_VNET_NAME}/subnets/${var.NETWORKING_VNET_SERVICE_SUBNET_NAME}"
  client_id           = "${var.KUBERNETES_CLIENT_ID}"
  client_secret       = "${var.KUBERNETES_CLIENT_SECRET}"
  environment         = "${terraform.workspace}"
  network_plugin      = "${var.NETWORK_PLUGIN}"
  dns_service_ip      = "${var.DNS_SERVICE_IP}"
  service_cidr        = "${var.SERVICE_CIDR}"
  docker_bridge_cidr  = "${var.DOCKER_BRIDGE_CIDR}"
  rbac_enabled        = "${var.RBAC_ENABLED}"
  acr_enabled         = "${var.ACR_ENABLED}"
  acr_name            = "${var.ACR_NAME}"
  acr_sku             = "${var.ACR_SKU}"
}