#!/bin/bash

echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
echo 'export LINK_ARWEAVE_WALLET='${LINK_ARWEAVE_WALLET} >> $HOME/.bashrc
echo 'export LINK_KYVE_VERSION='${LINK_KYVE_VERSION} >> $HOME/.bashrc

source $HOME/.bashrc
POOL=0

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
	echo ======================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, смена пула произойдет через 5 минут"=
	echo ======================================================================================
sleep 10
if [[ $POOL = 0 ]] 
then	
	POOL=1
	echo ===========================================================
	echo ="ВНИМАНИЕ, СМЕНА ПУЛА! Выбран пул 1 (Avalanche // C-Chain)"=
	echo ===========================================================
elif [[ $POOL = 1 ]] 
then
	POOL=3
	echo ===============================================
	echo ="ВНИМАНИЕ, СМЕНА ПУЛА! Выбран пул 3 (Bitcoin)"=
	echo ===============================================
else  
	POOL=0
	echo ===============================================
	echo ="ВНИМАНИЕ, СМЕНА ПУЛА! Выбран пул 0 (Moonbeam)"=
	echo ===============================================
fi

done



