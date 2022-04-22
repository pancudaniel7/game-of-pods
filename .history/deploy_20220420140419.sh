#!/bin/bash

kubectl apply \
--dry-run=client \
-f deployments/volume.yaml \
-f deployments/deployments.yaml
            