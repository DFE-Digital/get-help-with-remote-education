variable environment {}
variable monitoring_instances {}
variable monitoring_username {}
variable monitoring_password {}
variable grafana_admin_password {}
variable paas_username { default = null }
variable paas_password { default = null }
variable paas_sso_passcode { default = null }
variable statuscake_username {}
variable statuscake_apikey {}
variable statuscake_alerts { default = {} }

locals {
  region        = "eu-west-2"
  paas_api_url  = "https://api.london.cloud.service.gov.uk"
  paas_org_name = "dfe"
  status_cake_group_id = [197663] # Get help with remote education https://app.statuscake.com/ContactGroup.php?CUID=197663
}
