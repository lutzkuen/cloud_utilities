#!/bin/bash
# taken from here: https://vujade.co/install-apache-airflow-ubuntu-18-04/
# you need to take some configurations from hand from that site
# set up a postgresql installation of airflow

sudo apt-get update --fix-missing
sudo apt-get upgrade

sudo apt-get install python-setuptools

sudo pip install --upgrade pip

sudo apt-get install postgresql postgresql-contrib

sudo apt-get install python-psycopg2

sudo apt-get install python3-pip

sudo apt-get install libpq-dev

sudo -u postgres psql -f postgres/setup_psql.sql

sudo -u postgres psql -d airflow -f postgres/test_psql.sql

sudo apt-get install rabbitmq-server

sudo python3.6 ./replace_setting.py /etc/rabbitmq/rabbitmq-env.conf NODE_IP_ADDRESS '0.0.0.0' '='

sudo service rabbitmq-server start

export AIRFLOW_HOME=~/airflow

sudo python3 -m pip install -U Flask==1.0.4

sudo python3 -m pip install apache-airflow

sudo python3 -m pip install psycopg2

sudo python3 -m pip install celery

airflow initdb

# set some new settings

python3.6 ./replace_setting.py ~/airflow/airflow.cfg executor CeleryExecutor ' = '
python3.6 ./replace_setting.py ~/airflow/airflow.cfg sql_alchemy_conn postgresql+psycopg2:///airflow ' = '
python3.6 ./replace_setting.py ~/airflow/airflow.cfg broker_url amqp://guest:guest@localhost:5672// ' = '
python3.6 ./replace_setting.py ~/airflow/airflow.cfg celery_result_backend amqp://guest:guest@localhost:5672// ' = '
python3.6 ./replace_setting.py ~/airflow/airflow.cfg result_backend amqp://guest:guest@localhost:5672// ' = '

airflow initdb
