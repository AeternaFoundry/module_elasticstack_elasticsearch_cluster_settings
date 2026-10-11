output "elasticsearch_cluster_settings_id" {
  description = "Map of id values across all elasticsearch_cluster_settings, keyed the same as var.elasticsearch_cluster_settings except keys with no id are omitted"
  value       = { for k, v in elasticstack_elasticsearch_cluster_settings.elasticsearch_cluster_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "elasticsearch_cluster_settings_elasticsearch_connection" {
  description = "Map of elasticsearch_connection values across all elasticsearch_cluster_settings, keyed the same as var.elasticsearch_cluster_settings except keys with no elasticsearch_connection are omitted"
  value       = { for k, v in elasticstack_elasticsearch_cluster_settings.elasticsearch_cluster_settings : k => v.elasticsearch_connection if v.elasticsearch_connection != null && length(v.elasticsearch_connection) > 0 }
  sensitive   = true
}
output "elasticsearch_cluster_settings_persistent" {
  description = "Map of persistent values across all elasticsearch_cluster_settings, keyed the same as var.elasticsearch_cluster_settings except keys with no persistent are omitted"
  value       = { for k, v in elasticstack_elasticsearch_cluster_settings.elasticsearch_cluster_settings : k => v.persistent if v.persistent != null && length(v.persistent) > 0 }
}
output "elasticsearch_cluster_settings_transient" {
  description = "Map of transient values across all elasticsearch_cluster_settings, keyed the same as var.elasticsearch_cluster_settings except keys with no transient are omitted"
  value       = { for k, v in elasticstack_elasticsearch_cluster_settings.elasticsearch_cluster_settings : k => v.transient if v.transient != null && length(v.transient) > 0 }
}

