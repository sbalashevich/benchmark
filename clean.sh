#!/usr/bin/env bash

kubectl delete deploy/o1p0
kubectl delete deploy/orderer
kubectl delete deploy/fabric-cli


kubectl delete pvc/orderer-claim
kubectl delete pvc/org1peer0-claim

kubectl delete pv/orderer
kubectl delete pv/org1peer0

kubectl delete namespace orderer
kubectl delete namespace org1
kubectl delete namespace org2


