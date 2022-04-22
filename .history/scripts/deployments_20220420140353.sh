#!/bin/bash

kubectl apply \
-dry-run \
-f ../deployments/volume.yaml \
-f ../deployments/deployments.yaml
            