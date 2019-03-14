resource "azurerm_kubernetes_cluster" "azure-kubernetes-service" {
    name                = "${var.name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    kubernetes_version  = "${var.kubernetes_version}"
    dns_prefix = "${var.dns_prefix}"
    linux_profile {
        admin_username = "${var.admin_user}"

        ssh_key {     
           key_data = "${var.ssh_key}" 
        }
    }

    agent_pool_profile {
        name            = "${var.agent_pool_name}"
        count           = "${var.agent_count}"
        vm_size         = "${var.vm_size}"
        os_type         = "${var.os_type}"
        os_disk_size_gb = "${var.os_disk_size_gb}"
        vnet_subnet_id  = "${var.vnet_subnet_id}"
        max_pods        = "${var.max_pods}"
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }

    tags {
        Environment = "${var.environment}"
    }

    network_profile {
        network_plugin = "${var.network_plugin}"
        dns_service_ip = "${var.dns_service_ip}"
        docker_bridge_cidr = "${var.docker_bridge_cidr}"
        service_cidr = "${var.service_cidr}"
    }

    role_based_access_control {
        enabled = "${var.rbac_enabled}"
    }

    # provisioner "local-exec" {
    #     command = "aks-install.ps1"
    #     interpreter = ["PowerShell"]
    #     working_dir = "scripts"
    # } 
}

// Container Registry

resource "azurerm_container_registry" "trade-container-registry" {
  count               = "${var.acr_enabled == "true" ? 1 : 0}"
  name                = "${var.acr_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"      
  admin_enabled       = true
  sku                 = "${var.acr_sku}"
}