#!/bin/bash

kubectl apply \
--dry-run=client \
-f deployments/volume.yaml \
-f deployments/deployment.yaml
            