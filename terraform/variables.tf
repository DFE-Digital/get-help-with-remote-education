variable monitoring_instances {}
variable monitoring_username {}
variable monitoring_password {}
variable grafana_admin_password {}
variable paas_username { default = null }
variable paas_password { default = null }
variable paas_sso_passcode { default = null }

locals {
  region        = "eu-west-2"
  paas_api_url  = "https://api.london.cloud.service.gov.uk"
  paas_org_name = "dfe-teacher-services"
}
