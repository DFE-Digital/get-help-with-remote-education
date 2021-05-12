
## Get Help with Remote Education - Govuk PaaS Configuration

The Get Help with Remote Education (GHRE) service is hosted on Govuk PaaS. The platform provides a scalable, adaptable service that can quickly be changed depending on the needs on the service. 

- [Govuk PaaS](https://www.cloud.service.gov.uk/)
- [Govuk PaaS Technical Guidance](https://technical-guidance.education.gov.uk/documentation/guides/govuk-paas.html)


### Prerequisites:

- Govuk PaaS account (can be requested from #digital-tools-support)
- Access to the spaces below as either a space auditor, developer or manager (only space developers can make changes)

### Current Architecture for Get Help with Remote Education service
  
The current platform is configured with 3 environments. Please see details of these below:

#### Development

- Organisation: dfe

- Space: get-help-with-remote-education-dev

##### Apps deployed in development:

| name                                       | processes   | routes                                                             |
|------------------------------------------- |------------ |------------------------------------------------------------------- |
| `alertmanager-ghre-dev`                    | web:1/1     | alertmanager-ghre-dev.london.cloudapps.digital                     |
| `get-help-with-remote-education-rails-dev` | web:1/1     | get-help-with-remote-education-rails-dev.london.cloudapps.digital  |
| `grafana-ghre-dev`                         | web:1/1     | grafana-ghre-dev.london.cloudapps.digital                          |
| `paas-prometheus-exporter-ghre-dev`        | web:1/1     | paas-prometheus-exporter-ghre-dev.london.cloudapps.digital         |
| `prometheus-ghre-dev`                      | web:1/1     | prometheus-ghre-dev.london.cloudapps.digital                       |

##### Services available in development:

| name                                    | service        | plan                 | bound apps                                                                       | broker       |
|---------------------------------------- |--------------- |--------------------- |--------------------------------------------------------------------------------- |------------- |
| `get-help-with-remote-education-pg-dev` | postgres       | tiny-unencrypted-12  | get-help-with-remote-education-rails-dev                                         | rds-broker   |
| `ghre-s3-private-dev`                   | aws-s3-bucket  | default              |                                                                                  | s3-broker    |
| `ghre-s3-public-dev`                    | aws-s3-bucket  | default              |                                                                                  | s3-broker    |
| `influxdb-ghre-dev`                     | influxdb       | tiny-1.x             | prometheus-ghre-dev                                                              | aiven-broker |

#### Staging

- Organisation: dfe

- Space: get-help-with-remote-education-staging

- Custom Domain: [https://get-help-with-remote-education-staging.education.gov.uk](https://get-help-with-remote-education-staging.education.gov.uk)

##### Apps deployed in staging:

| name                                           | processes   | routes                                                                                                                        |
|----------------------------------------------- |------------ |------------------------------------------------------------------------------------------------------------------------------ |
| `get-help-with-remote-education-rails-staging` | web:1/1     | get-help-with-remote-education-rails-staging.london.coudapps.digital, get-help-with-remote-education-staging.education.gov.uk |

##### Services available in staging:

| name                                         | service       | plan                 | bound apps                                                                            | broker      |
|--------------------------------------------  |-------------- |--------------------- |-------------------------------------------------------------------------------------- |------------ |
| `get-help-with-remote-education-cdn-staging` | cdn-route     | cdn-route            |                                                                                       | cdn-broker  |
| `get-help-with-remote-education-pg-staging`  | postgres      | tiny-unencrypted-12  | get-help-with-remote-education-rails-staging                                          | rds-broker  |
| `ghre-s3-public-staging`                     | aws-s3-bucket | default              |                                                                                       | s3-broker   |

#### Production

- Organisation: dfe-teacher-services

- Space: get-help-with-remote-education-prod

- Custom Domain: [https://get-help-with-remote-education.education.gov.uk](https://get-help-with-remote-education.education.gov.uk)

##### Apps deployed in production:

| name                                        | processes   | routes                                                                                                              |
|-------------------------------------------- |------------ |---------------------------------------------------------------------------------------------------------------------|
| `alertmanager-ghre-prod`                    | web:1/1     | alertmanager-ghre-prod.london.cloudapps.digital                                                                     |
| `get-help-with-remote-education-rails-prod` | web:3/3     | get-help-with-remote-education.education.gov.uk, get-help-with-remote-education-rails-prod.london.cloudapps.digital |
| `grafana-ghre-prod`                         | web:1/1     | grafana-ghre-prod.london.cloudapps.digital                                                                          |
| `paas-prometheus-exporter-ghre-prod`        | web:1/1     | paas-prometheus-exporter-ghre-prod.london.cloudapps.digital                                                         |
| `prometheus-ghre-prod`                      | web:1/1     | prometheus-ghre-prod.london.cloudapps.digital                                                                       |

##### Services available in production:

| name                                        | service         | plan        | bound apps                                                                     | broker       |
|-------------------------------------------- |---------------- |------------ |------------------------------------------------------------------------------- |------------- |
| `get-help-with-remote-education-cdn-prod`   | cdn-route       | cdn-route   |                                                                                | cdn-broker   |
| `get-help-with-remote-education-pg-prod`    | postgres        | small-12    | get-help-with-remote-education-rails-prod                                      | rds-broker   |
| `ghre-s3-private-prod`                      | aws-s3-bucket   | default     |                                                                                | s3-broker    |
| `ghre-s3-public-prod`                       | aws-s3-bucket   | default     |                                                                                | s3-broker    |
| `influxdb-ghre-prod`                        | influxdb        | tiny-1.x    | prometheus-ghre-prod                                                           | aiven-broker |
