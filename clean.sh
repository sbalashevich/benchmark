#!/usr/bin/env bash

kubectl delete deploy/peer0 --namespace=org1
kubectl delete deploy/orderer  --namespace=master
kubectl delete deploy/fabric-cli


kubectl delete pvc/orderer-claim
kubectl delete pvc/org1peer0-claim

kubectl delete pv/orderer
kubectl delete pv/org1peer0

kubectl delete namespace orderer
kubectl delete namespace org1
kubectl delete namespace org2


