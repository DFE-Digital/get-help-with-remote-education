# Get Help with Remote Education - Rails

## Prerequisites

- Ruby 2.7.2
- PostgreSQL
- NodeJS 12.13.x
- Yarn 1.12.x

## Setting up the app in development

1. Run `bundle install` to install the gem dependencies
2. Run `yarn` to install node dependencies
3. Run `bin/rails db:setup` to set up the database development and test schemas, and seed with test data
4. Run `bundle exec rails server` to launch the app on http://localhost:3000
5. Run `./bin/webpack-dev-server` in a separate shell for faster compilation of assets

### Environment variables

| Environment variable 	    | Example                                	  | Notes                                                                |
|------------------------   |------------------------------------------ |--------------------------------------------------------------------- |
| `DB_HOSTNAME`             | `localhost`                              	| Development/test environment only                                    |
| `DB_PORT`                 | `5432`                                   	| Development/test environment only                                    |
| `DB_USERNAME`             | `postgres`                               	| Development/test environment only                                    |
| `DB_PASSWORD`             | `password`                               	| Development/test environment only                                    |
| `DATABASE_URL`            | `postgres://user:pass@localhost:5432/db` 	|                                                                      |
| `GOOGLE_TAG_MGR_ID`       | `GTM-1234`                               	|                                                                      |
| `GOOGLE_ANALYTICS_ID`     | `G-1234`                                 	|                                                                      |

## Running specs, linter(without auto correct) and annotate models and serializers
```
bundle exec rake
```

## Running specs
```
bundle exec rspec
```

## Linting

It's best to lint just your app directories and not those belonging to the framework, e.g.

```bash
bundle exec rubocop app config db lib spec Gemfile --format clang -a

or

bundle exec scss-lint app/webpacker/styles
```

## Deploying on GOV.UK PaaS

### Prerequisites

- Your department, agency or team has a GOV.UK PaaS account
- You have a personal account granted by your organisation manager
- You have downloaded and installed the [Cloud Foundry CLI](https://github.com/cloudfoundry/cli#downloads) for your platform

### Deploy

This service is built to deploy to [GOV PaaS](https://www.cloud.service.gov.uk/) using Docker.

To deploy this service do the following:

1. Build the latest version of the app in Docker
2. Push the image to the github dfe-digital docker registry: `ghcr.io/dfe-digital/get-help-with-remote-education-${dev/staging/prod}:latest`
3. Login to cloudfoundary
4. Run the following
```
  cf target -o dfe-teacher-services -s get-help-with-remote-education-dev
  cf push -f ./config/manifests/${dev/staging/prod}_manifest.yml --docker-image ghcr.io/dfe-digital/get-help-with-remote-education-${dev/staging/prod}:latest
```
