# Get Help with Remote Education - Docker Registry

[Github container registry](https://docs.github.com/en/packages/guides/about-github-container-registry) is used for hosting and tracking the latest built docker image for the 3 environments.

Our containers are held in the DfE github organisation, with admin rights just for the ghre dev team & are publicly pullable:
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-dev
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-staging
- https://github.com/orgs/DFE-Digital/packages/container/package/get-help-with-remote-education-prod

## CI - Github Actions

The `GITHUB_TOKEN` actions environment variable [is used to authorize the image push](https://docs.github.com/en/packages/guides/migrating-to-github-container-registry-for-docker-images#updating-your-github-actions-workflow).