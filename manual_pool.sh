#!/bin/bash
echo ======================================
echo ="ВНИМАНИЕ! Выбрана РУЧНАЯ смена пула!"=
echo ======================================
for ((;;))
do

if [[ $POOL == 3 ]] 
then
	echo ==================================
	echo ="ВНИМАНИЕ! Выбран пул 3 (Bitcoin)"=
	echo ==================================
	wget ${LINK_KYVE_Bitcoin} && \
	unzip kyve-bitcoin-linux.zip && \
	rm kyve-bitcoin-linux.zip && \
	sudo mv bitcoin-linux /usr/bin/kyve-bitcoin
	sudo chmod a+x /usr/bin/kyve-bitcoin
	kyve-bitcoin --version
	sleep 2
	$(which kyve-bitcoin) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi
if [[ $POOL == 0 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 0 (Moonbeam)"=
	echo ===================================
	cd $HOME && \
	wget ${LINK_KYVE_VERSION} && \
	unzip evm-linux.zip && \
	rm evm-linux.zip && \
	mv evm-linux /usr/bin/kyve
	sudo chmod a+x /usr/bin/kyve
	kyve --version
	sleep 2
	$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi
if [[ $POOL == 1 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 1 (Avalanche // C-Chain)"=
	echo ===============================================
	wget ${LINK_KYVE_VERSION} && \
	unzip evm-linux.zip && \
	rm evm-linux.zip && \
	mv evm-linux /usr/bin/kyve
	sudo chmod a+x /usr/bin/kyve
	kyve --version
	sleep 2
	$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi 
if [[ $POOL == 4 ]]
then
	echo =================================
	echo ="ВНИМАНИЕ! Выбран пул 4 (Solana)"=
	echo =================================
	wget ${LINK_KYVE_Solana} && \
	unzip kyve-solana-linux.zip && \
	rm kyve-solana-linux.zip && \
	sudo mv kyve-solana-linux /usr/bin/kyve-solana-linux
	sudo chmod a+x /usr/bin/kyve-solana-linux
	kyve-solana-linux --version
	sleep 2
	$(which  kyve-solana-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi 
if [[ $POOL == 5 ]]
then
	echo ==================================
	echo ="ВНИМАНИЕ! Выбран пул 5 (Zilliqa)"=
	echo ==================================
	wget ${LINK_KYVE_Zilliqa} && \
	unzip kyve-zilliqa-linux.zip && \
	rm kyve-zilliqa-linux.zip && \
	sudo mv kyve-zilliqa-linux /usr/bin/kyve-zilliqa-linux
	sudo chmod a+x /usr/bin/kyve-zilliqa-linux
	kyve-zilliqa-linux --version
	sleep 2
	$(which  kyve-zilliqa-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi 
if [[ $POOL == 6 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 6 (Near)"=
	echo ===============================================
	wget ${LINK_KYVE_Near} && \
	unzip kyve-near-linux.zip && \
	rm kyve-near-linux.zip && \
	sudo mv kyve-near-linux /usr/bin/kyve-near-linux
	sudo chmod a+x /usr/bin/kyve-near-linux
	kyve-near-linux --version
	sleep 2
	$(which  kyve-near-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi 
if [[ $POOL == 7 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 7 (Celo)"=
	echo ===============================================
	wget ${LINK_KYVE_Celo} && \
	unzip kyve-celo-linux.zip && \
	rm kyve-celo-linux.zip && \
	sudo mv kyve-celo-linux /usr/bin/kyve-celo-linux
	sudo chmod a+x /usr/bin/kyve-celo-linux
	kyve-celo-linux --version
	sleep 2
	$(which  kyve-celo-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi 
if [[ $POOL == 8 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 8 (Evmos EVM)"=
	echo ===================================
	wget ${LINK_KYVE_VERSION} && \
	unzip evm-linux.zip && \
	rm evm-linux.zip && \
	mv evm-linux /usr/bin/kyve
	sudo chmod a+x /usr/bin/kyve
	kyve --version
	sleep 2
	$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi

if [[ $POOL == 9 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 9 (Cosmos Hub)"=
	echo ===================================
	wget ${LINK_KYVE_Cosmos} && \
	unzip kyve-cosmos-linux.zip && \
	rm kyve-cosmos-linux.zip && \
	mv kyve-cosmos-linux /usr/bin/kyve-cosmos-linux
	sudo chmod a+x /usr/bin/kyve-cosmos-linux
	kyve-cosmos-linux --version
	sleep 2
	$(which kyve-cosmos-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi

if [[ $POOL == 10 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 10 (Injective)"=
	echo ===================================
	wget ${LINK_KYVE_Cosmos} && \
	unzip kyve-cosmos-linux.zip && \
	rm kyve-cosmos-linux.zip && \
	mv kyve-cosmos-linux /usr/bin/kyve-cosmos-linux
	sudo chmod a+x /usr/bin/kyve-cosmos-linux
	kyve-cosmos-linux --version
	sleep 2
	$(which kyve-cosmos-linux) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ===============================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo ===============================================================================================
	sleep 2m
fi
done
