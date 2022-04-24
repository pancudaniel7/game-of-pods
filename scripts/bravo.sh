#!/bin/bash

# run this on node01

mkdir drupal-pv
mkdir drupal-mysql-data

# run this on controlplane

kubectl create secret generic drupal-mysql-secret --from-literal=MYSQL_ROOT_PASSWORD=root_password --from-literal=MYSQL_DATABASE=drupal-database --from-literal=MYSQL_USER=postgress