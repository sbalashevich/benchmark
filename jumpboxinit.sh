#!/usr/bin/env bash


export CHANNEL_NAME="testchannel"


export LOCAL_FOLDER=/benchmark/crypto-config
export FABRIC_CFG_PATH=/benchmark


cryptogen generate --config=./crypto/crypto-config.yml
mkdir channel-artifacts

configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

# test
cp config/core.yaml /volume/

# ORDERER
cp -r crypto-config/ordererOrganizations/master.svc.cluster.local/orderers/orderer.master.svc.cluster.local/* /orderer/
cp -r ./channel-artifacts /orderer/

# Org1Peer0
cp -r crypto-config/peerOrganizations/org1.svc.cluster.local/peers/peer0.org1.svc.cluster.local/* /org1peer0/
cp -r ./channel-artifacts /org1peer0/
cp config/core.yaml /org1peer0/