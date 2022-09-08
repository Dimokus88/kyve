#!/bin/bash
# By Dimokus (https://t.me/Dimokus)
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
sleep 5
runsvdir -P /etc/service &
echo 'export MONIKER='${MONIKER} >> $HOME/.bashrc
echo 'export binary='${binary} >> $HOME/.bashrc
echo 'export denom='${denom} >> $HOME/.bashrc
echo 'export chain='${chain} >> $HOME/.bashrc
source $HOME/.bashrc
#======================================================== НАЧАЛО БЛОКА ФУНКЦИЙ ==================================================
#-------------------------- Установка GO и кмопиляция бинарного файла -----------------------
INSTALL (){
#-----------КОМПИЛЯЦИЯ БИНАРНОГО ФАЙЛА------------
cd /
wget $gitrep
tar -xvzf chain_linux_amd64.tar.gz
chmod +x $binary
cp $binary /usr/bin/
wget https://github.com/KYVENetwork/chain/releases/download/v0.0.1/cosmovisor_linux_amd64 && \
mv cosmovisor_linux_amd64 /usr/bin/cosmovisor 

#-------------------------------------------------




#=======ИНИЦИАЛИЗАЦИЯ БИНАРНОГО ФАЙЛА================
echo =INIT=
rm /root/$folder/config/genesis.json
$binary init "$MONIKER" --chain-id $chain --home /root/$folder
sleep 5
$binary config chain-id $chain

$binary config keyring-backend os
chmod +x /usr/bin/cosmovisor
mkdir -p ~/$folder/cosmovisor/genesis/bin/ && \
echo "{}" > ~/$folder/cosmovisor/genesis/upgrade-info.json
cp chaind ~/$folder/cosmovisor/genesis/bin/$binary
export DAEMON_HOME=/root/$folder
export DAEMON_NAME=$binary
export DAEMON_ALLOW_DOWNLOAD_BINARIES=true
#====================================================

#===========ДОБАВЛЕНИЕ GENESIS.JSON===============
wget -O $HOME/$folder/config/genesis.json $genesis
sha256sum ~/$folder/config/genesis.json
cd && cat $folder/data/priv_validator_state.json
#=================================================

#===========ДОБАВЛЕНИЕ ADDRBOOK.JSON===============
rm $HOME/$folder/config/addrbook.json
wget -O $HOME/$folder/config/addrbook.json $addrbook
#==================================================
#-----ВНОСИМ ИЗМЕНЕНИЯ В CONFIG.TOML , APP.TOML.-----------
if [[ -n $link_peer ]]
then
	PEER=`curl -s $link_peer`
fi

if [[ -n $link_seed ]]
then
	SEED=`curl -s $link_seed`
fi

echo $PEER
echo $SEED
sleep 5
sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025$denom\"/;" $HOME/$folder/config/app.toml
sleep 1
sed -i.bak -e "s/^seeds *=.*/seeds = \"$SEED\"/;" $HOME/$folder/config/config.toml
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEER\"/;" $HOME/$folder/config/config.toml
sed -i.bak -e "s_"tcp://127.0.0.1:26657"_"tcp://0.0.0.0:26657"_;" $HOME/$folder/config/config.toml
pruning="custom" && \
pruning_keep_recent="5" && \
pruning_keep_every="1000" && \
pruning_interval="50" && \
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/$folder/config/app.toml && \
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/$folder/config/app.toml && \
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/$folder/config/app.toml && \
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/$folder/config/app.toml

sed -i 's/max_num_inbound_peers =.*/max_num_inbound_peers = 100/g' $HOME/$folder/config/config.toml
sed -i 's/max_num_outbound_peers =.*/max_num_outbound_peers = 100/g' $HOME/$folder/config/config.toml

snapshot_interval="1000" && \
sed -i.bak -e "s/^snapshot-interval *=.*/snapshot-interval = \"$snapshot_interval\"/" $HOME/$folder/config/app.toml
#-----------------------------------------------------------

#|||||||||||||||||||||||||||||||||||ФУНКЦИЯ Backup||||||||||||||||||||||||||||||||||||||||||||||||||||||
if [[ -n $LINK_SNAPSHOT ]]
then
	cd /root/$folder/
	wget -O snap.tar $LINK_SNAPSHOT
	tar xvf snap.tar 
	rm snap.tar
	echo ===============================================
	echo ===== Snapshot загружен!Snapshot loaded! ======
	echo ===============================================
	cd /
fi
#====================================

# ====================RPC======================
if [[ -n $SNAP_RPC ]]
then
	if [[ -n $link_rpc ]]
	then
		RPC=`curl -s $link_rpc`
	else
		RPC=`echo $SNAP_RPC,$SNAP_RPC`
	fi
	echo $RPC
	LATEST_HEIGHT=`curl -s $SNAP_RPC/block | jq -r .result.block.header.height`; \
	BLOCK_HEIGHT=$((LATEST_HEIGHT - $SHIFT)); \
	TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)
	echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH
	sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
	s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$RPC\"| ; \
	s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
	s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" $HOME/$folder/config/config.toml
	echo RPC
fi
#================================================
# |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
wget -O /tmp/priv_validator_key.json ${LINK_KEY}
file=/tmp/priv_validator_key.json
if  [[ -f "$file" ]]
then
	      sleep 2
	      cd /
	      rm /root/$folder/config/priv_validator_key.json
	      echo ==========priv_validator_key found==========
	      echo ========Обнаружен priv_validator_key========
	      cp /tmp/priv_validator_key.json /root/$folder/config/
	      echo ========Validate the priv_validator_key.json file=========
	      echo ==========Сверьте файл priv_validator_key.json============
	      cat /tmp/priv_validator_key.json
	      sleep 10
    else     	
    	echo "==================================================================================="
	echo "======== priv_validator_key not found! Specify direct download link ==============="
	echo "===== of the validator key file in the LINK_KEY variable in your deploy.yml ======="
	echo "===== If you don't have a key file, use the instructions at the link below ======="
	echo "== https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/valkey/README.md ===="
	echo "==================================================================================="
	echo "========  priv_validator_key ненайден! Укажите ссылку напрямое скачивание  ========"
	echo "========  файла ключа валидатора в переменной LINK_KEY в вашем deploy.yml  ========"
	echo "=====  Если у вас нет файла ключа, воспользуйтесь инструкцией по ссылке ниже ====="
	echo "== https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/valkey/README.md ===="
	echo "==================================================================================="
	echo "============= The node is running with the generated validator key! ==============="
	echo "==================================================================================="
	echo "================= Нода запущена с сгенерированным ключом валидатора! =============="
	echo "==================================================================================="
	RUN
	sleep infinity 	
    fi
}

RUN (){
#===========ЗАПУСК НОДЫ============
echo =Run node...=
cd /
mkdir /root/$binary
mkdir /root/$binary/log
    
cat > /root/$binary/run <<EOF 
#!/bin/bash
exec 2>&1
exec $binary start
EOF
chmod +x /root/$binary/run
LOG=/var/log/$binary

cat > /root/$binary/log/run <<EOF 
#!/bin/bash
mkdir $LOG
exec svlogd -tt $LOG
EOF
chmod +x /root/$binary/log/run
ln -s /root/$binary /etc/service
#==================
mkdir /root/cosmovisor
mkdir /root/cosmovisor/log
cat > /root/cosmovisor/run <<EOF 
#!/bin/bash
exec 2>&1
exec cosmovisor start
EOF
chmod +x /root/cosmovisor/run
LOG=/var/log/cosmovisor

cat > /root/cosmovisor/log/run <<EOF 
#!/bin/bash
mkdir $LOG
exec svlogd -tt $LOG
EOF
chmod +x /root/cosmovisor/log/run
ln -s /root/cosmovisor /etc/service
}
#--------------------------------------------------------------------------------------------
#======================================================== КОНЕЦ БЛОКА ФУНКЦИЙ ====================================================
INSTALL
sleep 15
RUN
sleep 1m
# -----------------------------------------------------------
for ((;;))
  do    
    tail -100 /var/log/$binary/current | grep -iv peer
    sleep 10m
  done
fi
