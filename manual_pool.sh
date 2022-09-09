#!/bin/bash
echo ========================================
echo ="ВНИМАНИЕ! Выбрана РУЧНАЯ смена пула!"=
echo ========================================


starting(){
	sudo chmod a+x /usr/bin/kyve
	kyve --version
	sleep 2
	$(which kyve) --name "${MONIKER}" --poolId ${POOL} --mnemonic "${MNEMONIC}" -s "${STAKE}" --keyfile /root/arweave.json --network korellia --verbose
	echo =================================================================================================
	echo ="Недостаточно средств для попадания в валидаторы, следующая попытка подключения через 2 минуты"=
	echo =================================================================================================
	sleep 2m
}

for ((;;))
do

if [[ $POOL == 0 ]]
then
	echo =====================================
	echo ="ВНИМАНИЕ! Выбран пул 0 (Moonbeam)"=
	echo =====================================
	cd $HOME  
	wget -O kyve ${LINK_KYVE_VERSION}
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 1 ]]
then
	echo =================================================
	echo ="ВНИМАНИЕ! Выбран пул 1 (Avalanche // C-Chain)"=
	echo =================================================
	wget -O kyve ${LINK_KYVE_VERSION}  
	mv kyve /usr/bin/kyve
	starting
fi 

if [[ $POOL == 3 ]] 
then
	echo ====================================
	echo ="ВНИМАНИЕ! Выбран пул 3 (Bitcoin)"=
	echo ====================================
	wget -O kyve ${LINK_KYVE_Bitcoin} 
	mv kyve /usr/bin/kyve
	starting
fi


if [[ $POOL == 4 ]]
then
	echo =================================
	echo ="ВНИМАНИЕ! Выбран пул 4 (Solana)"=
	echo =================================
	wget -O kyve ${LINK_KYVE_Solana} 
	mv kyve /usr/bin/kyve
	starting
fi 
if [[ $POOL == 5 ]]
then
	echo ==================================
	echo ="ВНИМАНИЕ! Выбран пул 5 (Zilliqa)"=
	echo ==================================
	wget -O kyve ${LINK_KYVE_Zilliqa}  
	mv kyve /usr/bin/kyve
	starting
fi 
if [[ $POOL == 6 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 6 (Near)"=
	echo ===============================================
	wget -O kyve ${LINK_KYVE_Near} 
	mv kyve /usr/bin/kyve
	starting
fi 
if [[ $POOL == 7 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 7 (Celo)"=
	echo ===============================================
	wget -O kyve ${LINK_KYVE_Celo} 
	mv kyve /usr/bin/kyve
	starting
fi 
if [[ $POOL == 8 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 8 (Evmos EVM)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_VERSION}  
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 9 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 9 (Cosmos Hub)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_Cosmos} 
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 10 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 10 (Injective)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_Cosmos} 
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 11 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 11 (Evmos Cosmos)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_Cosmos}  	 
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 12 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 12 (Axelar)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_Cosmos} 	  
	mv kyve /usr/bin/kyve
	starting
fi

if [[ $POOL == 13 ]]
then
	echo ===============================================
	echo ="ВНИМАНИЕ! Выбран пул 13 (Aurora)"=
	echo ===============================================
	wget -O kyve ${LINK_KYVE_VERSION}  
	mv kyve /usr/bin/kyve
	starting
fi 

if [[ $POOL == 14 ]]
then
	echo ===================================
	echo ="ВНИМАНИЕ! Выбран пул 11 (Cronos)"=
	echo ===================================
	wget -O kyve ${LINK_KYVE_Cosmos}  
	mv kyve /usr/bin/kyve
	starting
fi
done
