#!/bin/bash

kubectl apply \
-f ../deployments/volume.yaml \
-f ../deployments/deployments.yaml
            