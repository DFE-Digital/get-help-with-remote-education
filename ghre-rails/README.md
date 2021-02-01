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

| Environment variable 	  | Example                                	  | Notes                                                                               	|
|------------------------ |------------------------------------------ |-------------------------------------------------------------------------------------	|
| `DB_HOSTNAME`          	| `localhost`                              	| Development environment only                                                        	|
| `DB_PORT`              	| `5432`                                   	| Development environment only                                                        	|
| `DB_USERNAME`          	| `postgres`                               	| Development environment only                                                        	|
| `DB_PASSWORD`          	| `password`                               	| Development environment only                                                        	|
| `DB_URL`               	| `postgres://user:pass@localhost:5432/db` 	| Production environment only                                                         	|
| `BASIC_AUTH_USER`      	| `username`                               	| OPTIONAL, requires `BASIC_AUTH_PASSWORD`. Used for adding basic auth to the service 	|
| `BASIC_AUTH_PASSWORD`  	| `password`                               	| OPTIONAL, requires `BASIC_AUTH_USER`. Used for adding basic auth to the service     	|
| `GOOGLE_TAG_MGR_ID`    	| `GTM-1234`                               	|                                                                                     	|
| `GOOGLE_ANALYTICS_ID`  	| `G-1234`                                 	|                                                                                     	|

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

**TODO** - how to deploy this to gov paas using docker