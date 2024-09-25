output "resource_group_name" {
  value     = local.resource_group_name
  sensitive = false
}

output "storage_account_name" {
  value     = local.storage_account_name
  sensitive = false
}

output "container_name" {
  value     = var.state_container_name
  sensitive = false
}
