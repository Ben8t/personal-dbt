FROM python:3.8

RUN apt-get update

RUN apt-get install git libpq-dev python-dev python3-pip -y && \
    pip install cryptography~=3.4

RUN pip install pip install dbt-core==1.0.0 dbt-bigquery==1.0.0

COPY profiles.yml /root/.dbt/profiles.yml

WORKDIR /app