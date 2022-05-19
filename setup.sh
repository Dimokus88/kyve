#!/bin/bash
echo 'export AUTO_POOL='${AUTO_POOL} >> $HOME/.bashrc
echo 'export POOL='${POOL} >> $HOME/.bashrc
echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
echo 'export LINK_ARWEAVE_WALLET='${LINK_ARWEAVE_WALLET} >> $HOME/.bashrc
echo 'export LINK_KYVE_VERSION='${LINK_KYVE_VERSION} >> $HOME/.bashrc
echo 'export LINK_KYVE_Bitcoin='${LINK_KYVE_Bitcoin} >> $HOME/.bashrc
echo 'export LINK_KYVE_Solana='${LINK_KYVE_Solana} >> $HOME/.bashrc
echo 'export LINK_KYVE_Zilliqa='${LINK_KYVE_Zilliqa} >> $HOME/.bashrc
echo 'export LINK_KYVE_Near=' ${LINK_KYVE_Near} >> $HOME/.bashrc
echo 'export LINK_KYVE_Celo='${LINK_KYVE_Celo} >> $HOME/.bashrc
echo 'export LINK_KYVE_Cosmos='${LINK_KYVE_Cosmos} >> $HOME/.bashrci
source $HOME/.bashrc


wget -O arweave.json ${LINK_ARWEAVE_WALLET} 
mv arweave.json /root/arweave.json

cd /

if [[ $AUTO_POOL == yes ]]
then
sudo chmod a+x ./auto_pool.sh
sed -i 's/\r//' auto_pool.sh && ./auto_pool.sh

else
sudo chmod a+x ./manual_pool.sh
sed -i 's/\r//' manual_pool.sh && ./manual_pool.sh
fi



