#!/usr/bin/env bash

kubectl apply -f deployment/volumes/pvc_orderer.yml
kubectl apply -f deployment/volumes/pvc_org1peer0.yml

sleep 2

kubectl apply -f deployment/jump-box.yml

sleep 5

kubectl apply -f deployment/orderer.yml
kubectl apply -f deployment/org1peer0.yml