#!/bin/bash
echo 'export POOL='${POOL} >> $HOME/.bashrc
echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
echo 'export LINK_ARWEAVE_WALLET='${LINK_ARWEAVE_WALLET} >> $HOME/.bashrc
echo 'export LINK_KYVE_VERSION='${LINK_KYVE_VERSION} >> $HOME/.bashrc
echo 'export LINK_KYVE_Bitcoin='${LINK_KYVE_Bitcoin} >> $HOME/.bashrc
source $HOME/.bashrc


wget -O arweave.json ${LINK_ARWEAVE_WALLET} 
mv arweave.json /root/arweave.json

cd $HOME && \
wget ${LINK_KYVE_VERSION} && \
unzip evm-linux.zip && \
rm evm-linux.zip && \
mv evm-linux /usr/bin/kyve
sudo chmod a+x /usr/bin/kyve
kyve --version

wget ${LINK_KYVE_Bitcoin} && \
unzip kyve-bitcoin-linux.zip && \
rm kyve-bitcoin-linux.zip && \
sudo mv bitcoin-linux /usr/bin/kyve-bitcoin
sudo chmod a+x /usr/bin/kyve-bitcoin
kyve-bitcoin --version

for ((;;))
do

if [[ $POOL -eq 3 ]] 
then
	echo ==================================
	echo ="ВНИМАНИЕ! Выбран пул 3 (Bitcoin)"=
	echo ==================================
	$(which kyve-bitcoin) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo =======================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, смена пула произойдет через 2 минуты"=
	echo =======================================================================================
	POOL=0
	sleep 2m
else
	if [[ $POOL == 0 ]]
	then
		echo ===================================
		echo ="ВНИМАНИЕ! Выбран пул 0 (Moonbeam)"=
		echo ===================================
		$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
		echo =======================================================================================
		echo ="Недостаточно средств для попадания в валидаторы, смена пула произойдет через 2 минуты"=
		echo =======================================================================================
		POOL=1		
		sleep 2m
	else
		echo ===============================================
		echo ="ВНИМАНИЕ! Выбран пул 1 (Avalanche // C-Chain)"=
		echo ===============================================
		$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
		echo =======================================================================================
		echo ="Недостаточно средств для попадания в валидаторы, смена пула произойдет через 2 минуты"=
		echo =======================================================================================
		POOL=3		
		sleep 2m
	fi 
fi

done
