#!/bin/bash

echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
echo 'export LINK_ARWEAVE_WALLET='${LINK_ARWEAVE_WALLET} >> $HOME/.bashrc
echo 'export LINK_KYVE_VERSION='${LINK_KYVE_VERSION} >> $HOME/.bashrc
POOL=0
source $HOME/.bashrc


wget -O arweave.json ${LINK_ARWEAVE_WALLET} 
mv arweave.json /root/arweave.json

cd $HOME && \
wget ${LINK_KYVE_VERSION} && \
unzip evm-linux.zip && \
rm evm-linux.zip && \
mv evm-linux /usr/bin/kyve

kyve --version

for ((;;))
do
$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
sleep 5m
if [[ ${POOL} -gt 0 ]]
then
	POOL=0
	echo ======================================
	echo ="ВНИМАНИЕ, СМЕНА ПУЛА! Выбран пул 0"=
	echo ======================================
else 
	POOL=1
	echo ======================================
	echo ="ВНИМАНИЕ, СМЕНА ПУЛА! Выбран пул 1"=
	echo ======================================
fi
done



