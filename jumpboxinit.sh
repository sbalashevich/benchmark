#!/usr/bin/env bash


CHANNEL_NAME="mychannel"


export LOCAL_FOLDER=/benchmark/crypto-config
export FABRIC_CFG_PATH=/benchmark


cryptogen generate --config=./crypto/crypto-config.yml
mkdir channel-artifacts

configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

# ORDERER
cp -r crypto-config/ordererOrganizations /orderer/
cp -r ./channel-artifacts /orderer/

# Org1Peer0
#        - ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp:/etc/hyperledger/fabric/msp
#        - ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls:/etc/hyperledger/fabric/tls
cp -r crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/* /org1peer0/
cp -r ./channel-artifacts /org1peer0/
