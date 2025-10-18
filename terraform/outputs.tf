output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}

output "db_server" {
  value = module.sql.db_host
}

output "db_name" {
  value = module.sql.db_name
}