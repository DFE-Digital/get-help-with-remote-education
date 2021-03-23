# Get Help with Remote Education - Docker Registry

[Github container registry](https://docs.github.com/en/packages/guides/about-github-container-registry) is used for hosting and tracking the latest built docker image for the 3 environments.

Our containers are held in the DfE github organisation, with admin rights just for the ghre dev team & are publicly pullable:
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-dev
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-staging
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-prod

## CI - Github Actions

The `GITHUB_TOKEN` actions environment variable runs [doesn't have permissions to push to ghcr](https://docs.github.com/en/packages/guides/migrating-to-github-container-registry-for-docker-images#updating-your-github-actions-workflow) unfortunately, so we've followed github's suggestion of creating a [machine user](https://docs.github.com/en/developers/overview/managing-deploy-keys#machine-users).

The machine user is [ghre-docker](https://github.com/ghre-docker), which is linked to the ghre-docker@digital.education.gov.uk group email address.

A personal access token (PAT) for ghre-docker with repo & package write & read permissions is stored in a repo secret, `GH_USER_GHRE_DOCKER_PAT`.

2 factor authentication is a requirement for the DfE github org, the 2fa recovery codes for the ghre-docker machine user should be safely stored and handed over if dev team members change. https://docs.github.com/en/github/authenticating-to-github/recovering-your-account-if-you-lose-your-2fa-credentials