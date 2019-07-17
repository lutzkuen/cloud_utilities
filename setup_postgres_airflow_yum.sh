#!/bin/bash

# set up a postgresql installation of airflow

sudo yum update
sudo yum upgrade

sudo yum install python-setuptools

sudo pip install --upgrade pip

sudo yum install postgresql postgresql-contrib

sudo -u postgres psql -f postgres/setup_psql.sql

sudo -u postgres psql -d airflow -f postgres/test_psql.sql

export AIRFLOW_HOME=~/airflow

sudo python3 -m pip install apache-airflow

# workaround for broken werkzeug deps
sudo python3 -m pip install -U Flask==1.0.4

airflow initdb

