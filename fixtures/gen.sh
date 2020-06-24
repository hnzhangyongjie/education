#!/bin/bash

export PATH=/Users/renyi/go/src/github.com/hyperledger/fabric/release/darwin-amd64/bin:$PATH

rm -rf artifacts  crypto-config
mkdir artifacts
cryptogen generate --config=./crypto-config.yaml

configtxgen -profile OneOrgOrdererGenesis -outputBlock ./artifacts/genesis.block
#configtxgen -channelID kevinkongyixueyuan -outputBlock ./artifacts/genesis.block
configtxgen -profile OneOrgChannel -outputCreateChannelTx ./artifacts/channel.tx -channelID kevinkongyixueyuan
configtxgen -profile OneOrgChannel -outputAnchorPeersUpdate ./artifacts/Org1MSPanchors.tx -channelID kevinkongyixueyuan -asOrg KongyixueyuanOrg


###revers
#configtxgen -inspectBlock artifacts/genesis.block > genesis.block.json
#configtxgen -inspectBlock artifacts.bak/genesis.block > genesis.bak.json

#done
#configtxgen -inspectChannelCreateTx artifacts.bak/channel.tx > channel.tx.json
#configtxgen -inspectChannelCreateTx artifacts/channel.tx > channel.tx2.json

#done
#configtxgen -inspectChannelCreateTx artifacts.bak/Org1MSPanchors.tx > Org1MSPanchors.tx.json
#configtxgen -inspectChannelCreateTx artifacts/Org1MSPanchors.tx > Org1MSPanchors.tx2.json
