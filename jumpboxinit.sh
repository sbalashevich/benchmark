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

cp -r crypto-config/ordererOrganizations /orderer/
cp -r ./channel-artifacts /orderer/

