#!/usr/bin/env bash


CHANNEL_NAME="mychannel"


export LOCAL_FOLDER=/benchmark/crypto-config
export FABRIC_CFG_PATH=/benchmark


cryptogen generate --config=./crypto/crypto-config.yml
mkdir channel-artifacts

configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block  --configPath config/
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME  --configPath config/

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP  --configPath config/
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP  --configPath config/

# ORDERER
cp -r crypto-config/ordererOrganizations /orderer/
cp -r ./channel-artifacts /orderer/

# Org1Peer0
cp -r crypto-config/peerOrganizations/default.svc.cluster.local/peers/org1peer0.default.svc.cluster.local/* /org1peer0/
cp -r ./channel-artifacts /org1peer0/
cp config/core.yaml /org1peer0/