#!/usr/bin/env bash

cryptogen generate --config=./crypto/crypto-config.yml

cp -r crypto-config/ordererOrganizations /orderer/