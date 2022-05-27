#!/bin/bash
echo ================================================
echo ="ВНИМАНИЕ! Выбрана АВТОМАТИЧЕСКАЯ смена пула!"=
echo ================================================

starting(){
	sudo chmod a+x /usr/bin/kyve
	kyve --version
	sleep 2
	$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo ==============================================================================
	echo ="Недостаточно средств для попадания в валидаторы, смена пула через 2 минуты"=
	echo ==============================================================================
	sleep 2m

for ((;;))
do

if [[ $POOL == 0 ]]
then
	echo =====================================
	echo ="ВНИМАНИЕ! Выбран пул 0 (Moonbeam)"=
	echo =====================================
	cd $HOME  
	wget -O kyve.zip ${LINK_KYVE_VERSION}  
	unzip kyve.zip 
	rm kyve.zip  
	mv kyve-evm-linux /usr/bin/kyve
	starting
	POOL=1
	sleep 2m
fi

if [[ $POOL == 1 ]]
then
	echo =================================================
	echo ="ВНИМАНИЕ! Выбран пул 1 (Avalanche // C-Chain)"=
	echo =================================================
	wget -O kyve.zip ${LINK_KYVE_VERSION}  
	unzip kyve.zip  
	rm kyve.zip  
	mv kyve-evm-linux /usr/bin/kyve
	starting
	POOL=3
	sleep 2m
fi 

if [[ $POOL == 3 ]] 
then
	echo ====================================
	echo ="ВНИМАНИЕ! Выбран пул 3 (Bitcoin)"=
	echo ====================================
	wget -O kyve.zip ${LINK_KYVE_Bitcoin}  
	unzip kyve.zip  
	rm kyve.zip  
	sudo mv bitcoin-linux /usr/bin/kyve
	starting
	POOL=4
	sleep 2m
fi

if [[ $POOL == 4 ]]
then
	echo =================================
	echo ="ВНИМАНИЕ! Выбран пул 4 (Solana)"=
	echo =================================
	wget -O kyve.zip ${LINK_KYVE_Solana}  
	unzip kyve.zip  
	rm kyve.zip  
	sudo mv kyve-solana-linux /usr/bin/kyve
	starting
	POOL=5
	sleep 2m
fi 

if [[ $POOL == 5 ]]
then
	echo ==================================
	echo ="ВНИМАНИЕ! Выбран пул 5 (Zilliqa)"=
	echo ==================================
	wget -O kyve.zip ${LINK_KYVE_Zilliqa}  
	unzip kyve.zip  
	rm kyve.zip  
	sudo mv kyve-zilliqa-linux /usr/bin/kyve
	starting
	POOL=6
	sleep 2m
fi 

if [[ $POOL == 6 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 6 (Near)"=
	echo ===============================================
	wget -O kyve.zip ${LINK_KYVE_Near}  
	unzip kyve.zip  
	rm kyve.zip 
	sudo mv kyve-near-linux /usr/bin/kyve
	starting
	POOL=7
	sleep 2m
fi

if [[ $POOL == 7 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 7 (Celo)"=
	echo ===============================================
	wget -O kyve.zip ${LINK_KYVE_Celo}  
	unzip kyve.zip  
	rm kyve.zip  
	sudo mv kyve-celo-linux /usr/bin/kyve
	starting
	POOL=8
	sleep 2m
fi 

if [[ $POOL == 8 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 8 (Evmos EVM)"=
	echo ===================================
	wget -O kyve.zip ${LINK_KYVE_VERSION}  
	unzip kyve.zip 
	rm kyve.zip  
	mv evm-linux /usr/bin/kyve
	starting
	POOL=9
	sleep 2m
fi
if [[ $POOL == 9 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 9 (Cosmos Hub)"=
	echo ===================================
	wget -O kyve.zip ${LINK_KYVE_Cosmos}  
	unzip kyve.zip  
	rm kyve.zip  
	mv kyve-cosmos-linux /usr/bin/kyve
	starting
	POOL=10
	sleep 2m
fi

if [[ $POOL == 10 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 10 (Injective)"=
	echo ===================================
	wget -O kyve.zip ${LINK_KYVE_Cosmos}  
	unzip kyve.zip  
	rm kkyve.zip  
	mv kyve-cosmos-linux /usr/bin/kyve
	starting
	POOL=11
	sleep 2m
fi

if [[ $POOL == 11 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 11 (Evmos Cosmos)"=
	echo ===================================
	wget -O kyve.zip ${LINK_KYVE_Cosmos}  
	unzip kyve.zip 
	rm kyve.zip 
	mv kyve-cosmos-linux /usr/bin/kyve
	starting
	POOL=12
	sleep 2m
fi

if [[ $POOL == 12 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 12 (Axelar)"=
	echo ===================================
	wget -O kyve.zip ${LINK_KYVE_Cosmos} 
	unzip kyve.zip  
	rm kyve.zip  
	mv kyve-cosmos-linux /usr/bin/kyve
	starting
	POOL=13
	sleep 2m
fi

if [[ $POOL == 13 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 13 (Aurora)"=
	echo ===============================================
	wget -O kyve.zip ${LINK_KYVE_VERSION}  
	unzip kyve.zip 
	rm kyve.zip 
	mv kyve-evm-linux /usr/bin/kyve
	starting
	POOL=0
	sleep 2m
fi 
done
