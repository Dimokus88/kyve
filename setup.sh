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
sleep 2

wget ${LINK_KYVE_Bitcoin} && \
unzip kyve-bitcoin-linux.zip && \
rm kyve-bitcoin-linux.zip && \
sudo mv bitcoin-linux /usr/bin/kyve-bitcoin
sudo chmod a+x /usr/bin/kyve-bitcoin
kyve-bitcoin --version
sleep 2

wget ${LINK_KYVE_Solana} && \
unzip kyve-solana-linux.zip && \
rm kyve-solana-linux.zip && \
sudo mv kyve-solana-linux /usr/bin/kyve-solana-linux
sudo chmod a+x /usr/bin/kyve-solana-linux
kyve-solana-linux --version
sleep 2

wget ${LINK_KYVE_Zilliqa} && \
unzip kyve-zilliqa-linux.zip && \
rm kyve-zilliqa-linux.zip && \
sudo mv kyve-zilliqa-linux /usr/bin/kyve-zilliqa-linux
sudo chmod a+x /usr/bin/kyve-zilliqa-linux
kyve-zilliqa-linux --version

wget ${LINK_KYVE_Near} && \
unzip kyve-near-linux.zip && \
rm kyve-near-linux.zip && \
sudo mv kyve-near-linux /usr/bin/kyve-near-linux
sudo chmod a+x /usr/bin/kyve-near-linux
kyve-near-linux --version

cd /

if [[ $AUTO_POOL == yes ]]
then
sudo chmod a+x ./auto_pool.sh
sed -i 's/\r//' auto_pool.sh && ./auto_pool.sh

else
sudo chmod a+x ./manual_pool.sh
sed -i 's/\r//' manual_pool.sh && ./manual_pool.sh
fi



