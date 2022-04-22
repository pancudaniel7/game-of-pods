#!/bin/bash

# To debug you can add --dry-run

kubectl apply \
-f deployments/volume.yaml \
-f deployments/deployment.yaml
            