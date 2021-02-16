environment = "prod"
monitoring_instances = ["prod"]
statuscake_alerts = {
  cloudfront = {
    website_name = "Get help with remote education prod via Cloudfront"
    website_url = "https://get-help-with-remote-education.education.gov.uk/"
  }
  paas = {
    website_name = "Get help with remote education prod via PaaS"
    website_url = "https://get-help-with-remote-education-rails-prod.london.cloudapps.digital/"
  }
}
