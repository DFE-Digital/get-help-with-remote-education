## Deploy monitoring
A monitoring instance has access by default to all of the get-help-with-remote-education spaces.
There is a prod montoring instance and a dev one to test new dashboatds, alerts, etc.

### Allow monitoring user
The monitoring user must have at leat SpaceAuditor role in all the spaces to be able to read all the metrics.

### Create terraform bucket
It is required to store the terraform state.
```
% cf target -s get-help-with-remote-education-prod
API endpoint:   https://api.london.cloud.service.gov.uk
...
% cf create-service aws-s3-bucket default ghre-s3-private-prod
OK
```

### Create service key
Generate AWS access keys for external access.
```
% cf create-service-key ghre-s3-private-prod ghre-s3-private-prod -c '{"allow_external_access": true}'
OK
% cf service-key ghre-s3-private-prod ghre-s3-private-prod
{
 "aws_access_key_id": "XXXXXXXXX",
 "aws_region": "eu-west-2",
 "aws_secret_access_key": "YYYYYYYYY",
 "bucket_name": "paas-s3-broker-prod-lon-AAAAA-BBBBB",
 "deploy_env": ""
}
```

### Configure AWS environment
Create an AWS profile with the keys above.
```
% aws configure --profile ghre-monitoring-prod
AWS Access Key ID [None]: XXXXXXXXX
AWS Secret Access Key [None]: YYYYYYYYY
Default region name [None]: eu-west-2
Default output format [None]:
```

### Export secrets
Paas monitoring user (readonly on all the spaces):
```
% export monitoring_username=aaaa
% export monitoring_password=bbbb
```
Grafana admin password
```
% export grafana_admin_password=cccc
```
Paas deploy user (not SSO)
```
% export paas_username=dddd
% export paas_password=eeee
```
Paas deploy user (SSO)
```
% export paas_sso_passcode=ffff
```
Export AWS profile set up above
```
% export AWS_PROFILE=ghre-monitoring-prod
```

### Plan changes
```
% make prod monitoring-plan
```

### Apply changes
```
% make prod monitoring-apply
```

