#!/bin/bash

kubectl apply \
-f deployments/volume.yaml \
-f deployments/deployment.yaml
            