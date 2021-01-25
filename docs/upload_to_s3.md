## Guidance on manual upload of content to AWS S3

The Get Help with Remote Education (GHRE) service relies on AWS S3 for hosting content on the rapid-testing page (https://get-help-with-remote-education.education.gov.uk/rapid-testing/). The S3 service itself was brokered through the use of govuk PaaS.

**Until a time where the provision of this content can be automated, it is required that new and updated content is manually uploaded by a person with the correct access.**

### Current Architecture for GHRE S3 service

Each environment is configured within a space in govuk PaaS. SpaceDevelopers are able to access and configure the S3 services detailed below.

#### Development
- Organisation: dfe
- Space: get-help-with-remote-education-dev
- Service Name: ghre-s3-public-dev
- Service Key: ghre-s3-public-dev

#### Staging
- Organisation: dfe
- Space: get-help-with-remote-education-staging
- Service Name: ghre-s3-public-staging
- Service Key: ghre-s3-public-staging

#### Production
- Organisation: dfe
- Space: get-help-with-remote-education-prod
- Service Name: ghre-s3-public-prod
- Service Key: ghre-s3-public-prod

### How to create an AWS S3 service instance in govuk PaaS
The below steps explain how to create a new S3 service via the cloudfoundry cli.

#### Prerequisites
1. Ensure you have an account set up on govuk PaaS
    - https://docs.cloud.service.gov.uk/get_started.html#get-an-account

2. Ensure that you have been added to the correct space (details above) with the ‘SpaceDeveloper’ role assigned.
    - Digital Tools Support (#digital-tools-support slack channel can help with this)

3. Install the cloud foundry cli
    - https://docs.cloud.service.gov.uk/get_started.html#set-up-the-cloud-foundry-command-line

#### Steps to create the S3 service
Please execute the below steps to create a new public S3 service and set up an access key. You will need to replace values in bold and uppercase with the correct values.

Login with the cf cli:
```
cf login -a https://api.london.cloud.service.gov.uk -u YOUR_USERNAME
```

Select the space you want to access:
```
Authenticating...
OK
Select an org:
1. dfe-digital
2. dfe
Org (enter to skip): 2
Select a space:
1. get-help-with-remote-education-dev
2. get-help-with-remote-education-staging
3. get-help-with-remote-education-prod
4. sandbox
Space (enter to skip): 1
Targeted space get-help-with-remote-education-dev.
```

Create the new service:
```
cf create-service aws-s3-bucket default SERVICE_NAME -c '{"public_bucket":true}
```

Create a service key to allow external access to the S3 bucket
```
cf create-service-key SERVICE_NAME SERVICE_KEY_NAME -c '{"allow_external_access": true}'
```

### How to manually upload content to AWS S3
The below steps explain how to upload new or updated content to an AWS S3 instance associated with the service.

If you are deploying to an existing S3 service under get-help-with-remote-education you can jump to step 5 under the ‘Steps to upload new or updated content using the aws cli’ section.

#### Prerequisites
1. A S3 service instance exists for the target space (See ‘How to create an AWS S3 service instance in govuk PaaS’ above)
2. Ensure you have an account set up on govuk PaaS
    - https://docs.cloud.service.gov.uk/get_started.html#get-an-account
3. Ensure that you have been added to the correct space (details above) with the ‘SpaceDeveloper’ role assigned.
    - Digital Tools Support (#digital-tools-support slack channel can help with this)
4. Install the cloud foundry cli
    - https://docs.cloud.service.gov.uk/get_started.html#set-up-the-cloud-foundry-command-line
5. Install the aws cli
    - https://aws.amazon.com/cli/

#### Steps to upload new or updated content using the aws cli
Please execute the following steps to configure your aws cli and upload content to the S3 bucket.

Login with the cf cli
```
cf login -a https://api.london.cloud.service.gov.uk -u YOUR_USERNAME
```

Select the space you want to access:
```
Authenticating...
OK
Select an org:
1. dfe-digital
2. dfe
Org (enter to skip): 2
Select a space:
1. get-help-with-remote-education-dev
2. get-help-with-remote-education-staging
3. get-help-with-remote-education-prod
4. sandbox
Space (enter to skip): 1
Targeted space get-help-with-remote-education-dev.
```

Display the available services
```
cf services
```

List service keys
```
cf service-keys SERVICE_NAME
```

Display the details for the service key you require (keep a note of the output)
```
cf service-key SERVICE_NAME SERVICE_KEY_NAME
```

Configure a new user profile using the aws cli
```
aws configure --profile PROFILE_NAME
```

Use the newly created aws profile to upload content to the s3 bucket using the below command
```
aws --profile PROFILE_NAME s3 cp LOCAL_FILE_NAME s3://BUCKET_NAME/
```
- Replace any spaces in the file name and use uniform separators throughout
- Do not forget to add the trailing slash after the s3 bucket name

Execute the following command to ensure that the file has been uploaded successfully
```
aws --profile PROFILE_NAME s3 ls BUCKET_NAME
```

Your file should be accessible at
https://BUCKET_NAME.s3.amazonaws.com/LOCAL_FILE_NAME

**You will need to update/add any references and/or anchor tags in your application to point to the newly uploaded content**
