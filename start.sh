#!/usr/bin/env bash

mkdir -p /tmp/orderer
mkdir -p /tmp/org1peer0
mkdir -p /tmp/org1peer1
mkdir -p /tmp/org2peer0
mkdir -p /tmp/org2peer1


kubectl apply -f deployment/namespaces.yml

sleep 2

kubectl apply -f deployment/volumes.yml

sleep 5

kubectl apply -f deployment/jump-box.yml

sleep 20

cp -r /tmp/orderer/* /tmp/orderer_master/
cp -r /tmp/org1peer0/* /tmp/org1peer0_master/

kubectl apply -f deployment/orderer_withnamespaces.yml

sleep 2


kubectl apply -f deployment/orderer.yml


#kubectl apply -f deployment/org1peer0.yml