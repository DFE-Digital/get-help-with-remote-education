module prometheus_all {
  for_each = toset(var.monitoring_instances)

  source = "git::https://github.com/DFE-Digital/bat-platform-building-blocks.git//terraform/modules/prometheus_all"

  monitoring_instance_name = "ghre-${each.value}"
  monitoring_org_name      = local.paas_org_name
  monitoring_space_name    = "get-help-with-remote-education-${each.value}"
  paas_exporter_username   = var.monitoring_username
  paas_exporter_password   = var.monitoring_password
  # alertmanager_config      = file("${path.module}/files/alertmanager.yml")
  grafana_admin_password = var.grafana_admin_password
  grafana_json_dashboards  = [file("${path.module}/dashboards/web_traffic.json")]
}

resource statuscake_test alert {
  for_each      = var.statuscake_alerts

  website_name  = each.value.website_name
  website_url   = each.value.website_url
  test_type     = "HTTP"
  check_rate    = 30
  contact_group = local.status_cake_group_id
  trigger_rate  = 0
  confirmations = 1
}
