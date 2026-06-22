variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-ghe-copilot-miniproject"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks-ghe-copilot-miniproject"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "system_node_count" {
  description = "Number of nodes in the system node pool"
  type        = number
  default     = 1
}

variable "user_node_count" {
  description = "Number of nodes in the user node pool"
  type        = number
  default     = 1
}