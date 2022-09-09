#!/bin/bash
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
sleep 1
binary=`cat ~/.bashrc | grep binary | sed -e "s_export binary=__;"`
denom=`cat ~/.bashrc | grep denom | sed -e "s_export denom=__;"`
chain=`cat ~/.bashrc | grep chain | sed -e "s_export chain=__;"`
MONIKER=`cat ~/.bashrc | grep MONIKER | sed -e "s_export MONIKER=__;"`
echo -e "\n=== Starting the script to create the validator =="
echo -e "\n== Начало работы скрипта по созданию валидатора =="
sleep 5
if [[ -z "$wallet_name" ]]
then
echo -e "\nВведите имя кошелька:"
read -p "Enter wallet name: " wallet_name
echo 'export wallet_name='${wallet_name} >> $HOME/.bashrc
fi
sleep 2
echo -e "\n==== Importing wallet, enter mnemonic and set password (hidden input!) ===="
echo -e "\n== Импортирую кошелек, введите mnemonic и задайте пароль (скрытый ввод!) =="
$binary keys add ${wallet_name} --recover
sleep 2
if [[ -z "$wallet_pass" ]]
then
echo -e "\nПовторите ввод пароля от кошелька:"
read -s -p "Re-enter your wallet password: " wallet_pass
echo 'export wallet_pass='${wallet_pass} >> $HOME/.bashrc
fi
address=`(echo ${wallet_pass}) | $binary keys show $wallet_name -a | sed -e "s_/root/.__;"`
echo 'export address='${address} >> $HOME/.bashrc
sleep 2
valoper=`(echo ${wallet_pass}) | $binary keys show $wallet_name --bech val -a | sed -e "s_/root/.__;"`
echo 'export valoper='${valoper} >> $HOME/.bashrc
echo -e "\n===== Request tokens from faucet at ${address} ===="
echo -e "\n== Запросите токены из крана на адрес ${address} =="
sleep 5
sync=`curl -s localhost:26657/status | jq .result.sync_info.catching_up`
sleep 2
echo -e "\n== Requesting balance =="
echo -e "\n== Запрашиваю баланс ==="
sleep 2
balance=`$binary q bank balances $address -o json | jq -r .balances[0].amount `
sleep 2
echo $balance $denom
sleep 2
while [[ `echo $balance` -lt  1001000 ]]
do
echo -e "\n=== Insufficient balance of tokens to create a validator. Tokens on balance $balance $denom, minimum 1001000$denom required ===="
echo -e "\n===================== Request tokens from faucet at ${address} ==========================="
echo -e "\n== Недостаточный баланс токенов для создания валидатора. Токенов на балансе $balance $denom, необходимо минимум 1001000$denom =="
echo -e "\n===================== Запросите токены из крана на адрес ${address} ==================="
sleep 1m
balance=`$binary q bank balances $address -o json | jq -r .balances[0].amount `
done
sleep 2
echo -e "\n===== Enough balance to create a validator ====="
echo -e "\n== Достаточный баланс для создания валидатора =="
sleep 2
echo $balance $denom
sleep 2
echo -e "\n== Creating a validator =="
echo -e "\n==== Создаю валидатора ==="
sleep 2
DATE=`date`
(echo ${wallet_pass}) | $binary tx staking create-validator --amount="10000000000$denom" --pubkey=$($binary tendermint show-validator) --moniker="$MONIKER" --chain-id="$chain" --commission-rate="0.10" --commission-max-rate="0.20" --commission-max-change-rate="0.01" --min-self-delegation="1000000" --from="$address" --details="Powered on Akash Network! Create $DATE" --fees="5000000$denom" --gas="auto" -y
sleep 10
val=`$binary query staking validator $valoper -o json | jq -r .description.moniker`
if [[ -z "$val" ]]
then
echo "\n========================================= Validator not created! ==========================================="
echo "\n======== Check the log for errors, you can contact Akash_ru chat for support: https://t.me/AkashNW ========="
echo "\n========================================== Валидатор не создан! ============================================"
echo "\n== Проверьте лог на наличие ошибок, за поддержкой можете обратиться в чат Akash_ru: https://t.me/akash_ru =="
else
echo -e "\n== $val validator created successfully! =="
echo -e "\n===== Валидатор $val успешно создан! ====="
fi
sleep 10
echo -e "\n====== Script completed! ======"
echo -e "\n== Работа скрипта завершена! =="
