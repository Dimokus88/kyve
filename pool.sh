#!/bin/bash
apt-get install -y yarn
git clone git@github.com:KYVENetwork/node.git
cd node

yarn install
yarn setup
wget -O /root/arweave.json $LINK_ARWEAVE_WALLET
echo ========================================
echo ="ВНИМАНИЕ! Выбрана РУЧНАЯ смена пула!"=
echo ========================================
starting (){
	sudo chmod a+x /usr/bin/kyve
	sleep 2
	kyve wallets add "wallet" "$(cat /root/arweave.json)"
	kyve valaccounts add  "account" "$MNEMONIC"
	kyve start --pool ${POOL} --account account --wallet wallet --network beta --verbose	
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
	LINK_KYVE_VERSION="https://kyve-beta.s3.eu-central-1.amazonaws.com/protocol-node-binaries/evm/kyve-linux-x64"
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
	LINK_KYVE_VERSION="https://kyve-beta.s3.eu-central-1.amazonaws.com/protocol-node-binaries/evm/kyve-linux-x64"
	wget -O kyve ${LINK_KYVE_VERSION}  
	mv kyve /usr/bin/kyve
	starting
fi 

if [[ $POOL == 2 ]] 
then
	echo ====================================
	echo ="ВНИМАНИЕ! Выбран пул 2 (Celo)"=
	echo ====================================
	LINK_KYVE_Bitcoin="https://kyve-beta.s3.eu-central-1.amazonaws.com/protocol-node-binaries/celo/kyve-linux-x64"
	wget -O kyve ${LINK_KYVE_Bitcoin} 
	mv kyve /usr/bin/kyve
	starting
fi

done
