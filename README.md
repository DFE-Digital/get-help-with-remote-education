# Get Help with Remote Education - Rails

## Setting up the app in development

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Clone down repository locally
3. Run `docker-compose run web rake db:create` to create the test and development databases
4. Run `docker-compose up -d --build` in `ghre-rails` folder
5. Open Docker Desktop and expand `ghre-rails` application to view logs
6. go to `localhost:3001` in web browser to see site
7. Run `docker-compose up -d --build` again to rebuild the locally running application with the latest local code

### Environment variables

| Environment variable 	 | Example                                	   | Notes                             |
|------------------------|--------------------------------------------|-----------------------------------|
| `DB_HOSTNAME`          | `localhost`                              	 | Development/test environment only |
| `DB_PORT`              | `5432`                                   	 | Development/test environment only |
| `DB_USERNAME`          | `postgres`                               	 | Development/test environment only |
| `DB_PASSWORD`          | `password`                               	 | Development/test environment only |
| `DATABASE_URL`         | `postgres://user:pass@localhost:5432/db` 	 |                                   |
| `GOOGLE_TAG_MGR_ID`    | `GTM-1234`                               	 |                                   |
| `GOOGLE_ANALYTICS_ID`  | `G-1234`                                 	 |                                   |

## Running specs, linter(without auto correct) and annotate models and serializers
```
docker-compose exec web bundle exec rake
```

## Running specs
```
docker-compose exec web bundle exec rspec
```

## Linting

It's best to lint just your app directories and not those belonging to the framework, e.g.

```bash
docker-compose exec web bundle exec rubocop app config db lib spec Gemfile --format clang -a

or

docker-compose exec web bundle exec scss-lint app/webpacker/styles
```

## Deploying on GOV.UK PaaS

This service is built to deploy to [GOV PaaS](https://www.cloud.service.gov.uk/) using Docker.

**[Github actions on the repo](https://github.com/DFE-Digital/get-help-with-remote-education/actions) are automatically triggered once a branch has been merged.**

It is sometimes useful to deploy from your local machine. This should only be done in an emergency! 

Here are the steps:

### Prerequisites

- Your department, agency or team has a GOV.UK PaaS account
- You have a personal account granted by your organisation manager
- You have downloaded and installed the [Cloud Foundry CLI](https://github.com/cloudfoundry/cli#downloads) for your platform

### Deploy

1. Build the latest version of the app in Docker
2. Push the image to the github dfe-digital docker registry: `ghcr.io/dfe-digital/get-help-with-remote-education-${dev/prod}:latest`
3. Login to cloudfoundary
4. Run the following
```
  cf target -o dfe-teacher-services -s get-help-with-remote-education-dev
  cf push -f ./config/manifests/${dev/prod}_manifest.yml --docker-image ghcr.io/dfe-digital/get-help-with-remote-education-${dev/prod}:latest
```
