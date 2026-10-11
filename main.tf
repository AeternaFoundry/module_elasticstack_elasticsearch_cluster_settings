resource "elasticstack_elasticsearch_cluster_settings" "elasticsearch_cluster_settings" {
  for_each = var.elasticsearch_cluster_settings

  timeouts = each.value.timeouts

  dynamic "elasticsearch_connection" {
    for_each = each.value.elasticsearch_connection != null ? each.value.elasticsearch_connection : []
    content {
      api_key                  = elasticsearch_connection.value.api_key
      bearer_token             = elasticsearch_connection.value.bearer_token
      ca_data                  = elasticsearch_connection.value.ca_data
      ca_file                  = elasticsearch_connection.value.ca_file
      ca_fingerprint           = elasticsearch_connection.value.ca_fingerprint
      cert_data                = elasticsearch_connection.value.cert_data
      cert_file                = elasticsearch_connection.value.cert_file
      endpoints                = elasticsearch_connection.value.endpoints
      es_client_authentication = elasticsearch_connection.value.es_client_authentication
      headers                  = elasticsearch_connection.value.headers
      insecure                 = elasticsearch_connection.value.insecure
      key_data                 = elasticsearch_connection.value.key_data
      key_file                 = elasticsearch_connection.value.key_file
      password                 = elasticsearch_connection.value.password
      username                 = elasticsearch_connection.value.username
    }
  }

  dynamic "persistent" {
    for_each = each.value.persistent != null ? each.value.persistent : []
    content {
      dynamic "setting" {
        for_each = persistent.value.setting != null ? persistent.value.setting : []
        content {
          name       = setting.value.name
          value      = setting.value.value
          value_list = setting.value.value_list
        }
      }
    }
  }

  dynamic "transient" {
    for_each = each.value.transient != null ? each.value.transient : []
    content {
      dynamic "setting" {
        for_each = transient.value.setting != null ? transient.value.setting : []
        content {
          name       = setting.value.name
          value      = setting.value.value
          value_list = setting.value.value_list
        }
      }
    }
  }
}

