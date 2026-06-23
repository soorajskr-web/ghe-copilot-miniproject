output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.resource_group_name
}

output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = module.aks.aks_cluster_name
}

output "cluster_id" {
  description = "ID of the AKS cluster"
  value       = module.aks.aks_cluster_id
}

output "kube_config" {
  description = "Kubernetes config for kubectl"
  value       = module.aks.kube_config_raw
  sensitive   = true
}

output "nodepool_id" {
  description = "ID of the user node pool"
  value       = module.aks_nodepool.nodepool_id
}