#!/bin/bash

echo 'export POOL='${POOL} >> $HOME/.bashrc
echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
source $HOME/.bashrc

wget "https://drive.google.com/uc?export=download&id=16HOfjRTzG53WYH6BKVj-OZwsE9sKrZgz"

mv 'uc?export=download&id=16HOfjRTzG53WYH6BKVj-OZwsE9sKrZgz' /root/arweave.json

cd $HOME && \
wget https://github.com/KYVENetwork/evm/releases/download/v1.0.2/evm-linux.zip && \
unzip evm-linux.zip && \
rm evm-linux.zip && \
mv evm-linux /usr/bin/kyve

kyve --version

echo "${MNEMONIC}"

$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" --initialStake ${STAKE} --keyfile /root/arweave.json --network korellia --verbose


