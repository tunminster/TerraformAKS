variable "CREATOR" {
    type = "string",
    description = "Creator of this deployment"
}
variable "LOCATION" {
    type = "string",
    description = "Azure region to perform the deployment",
    default = "ukwest"
}
variable "RESOURCE_GROUP" {
    type = "string",
    description = "Azure Resource Group name"
}
variable "MODULE_VERSION" {
    type = "string",
    description = "Terraform version used for module"
}
variable "KUBERNETES_CLUSTER_NAME" {
    type = "string",
    description = "Name of Kubernetes cluster"
}                        
variable "DNS_PREFIX" {
    type = "string",
    description = "DNS prefix"
}      
variable "ADMIN_USER" { 
    type = "string",
    description = "VM admin username"
}
variable "SSH_KEY" {
    type = "string",
    description = "ssh-key"
}
variable "AGENT_POOL_NAME" {
    type = "string",
    description = "Name of agent pool"
}
variable "KUBERNETES_AGENT_COUNT" {
    type = "string",
    description = "Number of Kubernetes agents required"
}
variable "KUBERNETES_VM_SIZE" {
    type = "string",
    description = "VM size used for cluster"
}
variable "OS_TYPE" {
    type = "string",
    description = "Operating system of cluster"
}
variable "OS_DISK_SIZE_GB" {
    type = "string",
    description = "Disk size of VMs"
}
variable "NETWORKING_VNET_SUBSCRIPTION" {
    type = "string",
    description = "Networking Azure subscription"
}
variable "NETWORKING_VNET_RESOURCE_GROUP" {
    type = "string",
    description = "Networking resource group"
}
variable "NETWORKING_VNET_NAME" {
    type = "string",
    description = "Virtual network name"
} 
variable "NETWORKING_VNET_SERVICE_SUBNET_NAME" {
    type = "string",
    description = "Subnet name"
}
variable "KUBERNETES_CLIENT_ID" {
    type = "string",
    description = "Kubernetes client ID (from Azure AD Service Principal)"
}
variable "KUBERNETES_CLIENT_SECRET" {
    type = "string",
    description = "Kubernetes client secret (from Azure AD Service Principal)"
}
variable "NETWORK_PLUGIN" {
    type = "string",
    description = "Network plugin to use for networking. Changing this forces a new resource to be created"
}

variable "DNS_SERVICE_IP" {
    type = "string",
    description = "IP address within the Kubernetes service address range that will be used by cluster service discovery. Changing this forces a new resource to be created"
}

variable "SERVICE_CIDR" {
    type = "string",
    description = "The Network Range used by the Kubernetes service. Changing this forces a new resource to be created"
}


variable "DOCKER_BRIDGE_CIDR" {
    type = "string",
    description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created"
}

variable "RBAC_ENABLED" {
    type = "string",
    description = "Role based access control enabled. 1 = True, 0 = False"
}

variable "ACR_ENABLED" {
    type = "string"
    description = "Container Registry is enabled? true or false"
}

variable "ACR_NAME" {
    type = "string"
    description = "Container Registry name"
}

variable "ACR_SKU" {
    type = "string"
    description = "Container Registry SKU: Basic, Standard, Premium"    
}