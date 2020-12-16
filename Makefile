dev:
	$(eval bucket=paas-s3-broker-prod-lon-56a88ac5-a20e-48d3-8b84-2ad39df0f14f)
	$(eval env=dev)

prod:
	$(eval bucket=paas-s3-broker-prod-lon-600088fb-b1c5-45dd-a039-60f607fbd59a)
	$(eval env=prod)

terraform-init:
	cd terraform && \
		terraform init -reconfigure -upgrade=true \
		-backend-config=bucket=$(bucket)

	$(eval export TF_VAR_monitoring_username=$(monitoring_username))
	$(eval export TF_VAR_monitoring_password=$(monitoring_password))
	$(eval export TF_VAR_grafana_admin_password=$(grafana_admin_password))
	$(if $(paas_username), $(eval export TF_VAR_paas_username=$(paas_username)))
	$(if $(paas_password), $(eval export TF_VAR_paas_password=$(paas_password)))
	$(if $(paas_sso_passcode), $(eval export TF_VAR_paas_sso_passcode=$(paas_sso_passcode)))

monitoring-plan: terraform-init
	cd terraform && terraform plan -var-file workspace-variables/$(env).tfvars

monitoring-apply: terraform-init
	cd terraform && terraform apply -var-file workspace-variables/$(env).tfvars
