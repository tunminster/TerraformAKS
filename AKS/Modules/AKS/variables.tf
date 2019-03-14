
variable "name" {
    type = "string",
    description = "The name of the Managed Kubernetes Cluster to create"
}
variable "resource_group_name" {
    type = "string",
    description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist"
}
variable "location" {
    type = "string",
    description = "The location where the Managed Kubernetes Cluster should be created"
}                                      
variable "dns_prefix" {
    type = "string",
    description = "DNS prefix specified when creating the managed cluster"
}          
variable  "admin_user" {
    type = "string",
    description = "The Admin Username for the Cluster"
} 
variable  "ssh_key" {
    type = "string",
    description = "SSH key"
} 

variable  "agent_pool_name" {
    type = "string",
    description = "Unique name of the Agent Pool Profile in the context of the Subscription and Resource Group"
} 
variable  "agent_count" {
    type = "string",
    description = "Number of Agents (VMs) in the Pool. Possible values must be in the range of 1 to 100"
} 
variable  "vm_size" {
    type = "string",
    description = "The size of each VM in the Agent Pool"
} 
variable  "os_type" {
    type = "string",
    description = "The Operating System used for the Agents"
} 
variable  "os_disk_size_gb" {
    type = "string",
    description = "The Agent Operating System disk size in GB"
} 
variable  "vnet_subnet_id" {
    type = "string",
    description = "The ID of the Subnet where the Agents in the Pool should be provisioned"
} 
variable  "client_id" {
    type = "string",
    description = "The Client ID for the Service Principal"
} 
variable  "client_secret" {
    type = "string",
    description = "The Client Secret for the Service Principal"
} 
variable  "environment" {
    type = "string",
    description = "This variable is used to tag the resource in Azure"
} 
variable "network_plugin" {
    type = "string",
    description = "Network plugin to use for networking"
}
variable "dns_service_ip" {
    type = "string",
    description = "IP address within the Kubernetes service address range that will be used by cluster service discovery"
}
variable "docker_bridge_cidr" {
    type = "string",
    description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
}
variable "service_cidr" {
    type = "string",
    description = "Service Network CIDR"
}

variable "rbac_enabled" {
    type = "string",
    description = "Role based access control enable. 1 = true, 0 = false"
}

variable "max_pods" {
    type = "string"
    description = "Maximum number of pods per node"
    default = "110"
}

variable "kubernetes_version" {
    type = "string"
    description = "Kubernetes version to deploy"
    default = "1.10.12"
}

variable "acr_enabled" {
    type = "string"
    description = "Container Registry is enabled?"
}

variable "acr_name" {
    type = "string"
    description = "Container Registry name"
}

variable "acr_sku" {
    type = "string"
    description = "Container Registry SKU: Basic, Standard, Premium"    
}