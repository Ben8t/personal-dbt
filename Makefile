
IMAGE_TAG=personal-dbt
DBT_GOOGLE_BIGQUERY_KEYFILE_PROD=dbt-service-account.json
DBT_GOOGLE_PROJECT_PROD=personal-335920
DBT_GOOGLE_BIGQUERY_DATASET_PROD=prod

build:
	@docker build --no-cache -t $(IMAGE_TAG) .

dev:
	@docker container run --rm -it \
	-v $(PWD)/credentials/$(DBT_GOOGLE_BIGQUERY_KEYFILE_PROD):/root/.dbt/$(DBT_GOOGLE_BIGQUERY_KEYFILE_PROD) \
	-v $(PWD):/app \
	-e DBT_GOOGLE_BIGQUERY_KEYFILE_PROD=/root/.dbt/$(DBT_GOOGLE_BIGQUERY_KEYFILE_PROD) \
	-e DBT_GOOGLE_PROJECT_PROD=$(DBT_GOOGLE_PROJECT_PROD) \
	-e DBT_GOOGLE_BIGQUERY_DATASET_PROD=$(DBT_GOOGLE_BIGQUERY_DATASET_PROD) \
	-p 8080:8080 \
	--entrypoint bash $(IMAGE_TAG)
