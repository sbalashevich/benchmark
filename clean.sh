#!/usr/bin/env bash

kubectl delete deploy/peer0 --namespace=org1
kubectl delete deploy/orderer  --namespace=master
kubectl delete deploy/fabric-cli


kubectl delete pvc/orderer-claim
kubectl delete pvc/org1peer0-claim
kubectl delete pvc/orderer-claim --namespace=master
kubectl delete pvc/org1peer0-claim --namespace=master

kubectl delete pv/orderer
kubectl delete pv/org1peer0
kubectl delete pv/orderer  --namespace=org1
kubectl delete pv/org1peer0  --namespace=org1

kubectl delete svc/orderer --namespace=master
kubectl delete svc/org1peer0 --namespace=org1


kubectl delete namespace orderer
kubectl delete namespace org1
kubectl delete namespace org2

rm -rf /tmp/orderer/*
rm -rf /tmp/org1peer0/*
rm -rf /tmp/org1peer1/*
rm -rf /tmp/org2peer0/*
rm -rf /tmp/org2peer1/*
