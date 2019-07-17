#!/bin/bash

# set up a postgresql installation of airflow

sudo apt-get update --fix-missing
sudo apt-get upgrade

sudo apt-get install python-setuptools

sudo pip install --upgrade pip

sudo apt-get install postgresql postgresql-contrib

sudo -u postgres psql -f postgres/setup_psql.sql

sudo -u postgres psql -d airflow -f postgres/test_psql.sql

export AIRFLOW_HOME=~/airflow

sudo python3 -m pip install apache-airflow

airflow initdb

