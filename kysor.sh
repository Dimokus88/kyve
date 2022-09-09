#!/bin/bash
echo ================================================================================
echo ================================================================================
echo ===========██████╗░██╗███╗░░░███╗░█████╗░██╗░░██╗██╗░░░██╗░██████╗==============
echo ===========██╔══██╗██║████╗░████║██╔══██╗██║░██╔╝██║░░░██║██╔════╝==============
echo ===========██║░░██║██║██╔████╔██║██║░░██║█████═╝░██║░░░██║╚█████╗░==============
echo ===========██║░░██║██║██║╚██╔╝██║██║░░██║██╔═██╗░██║░░░██║░╚═══██╗==============
echo ===========██████╔╝██║██║░╚═╝░██║╚█████╔╝██║░╚██╗╚██████╔╝██████╔╝==============
echo ===========╚═════╝░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░╚═════╝░╚═════╝░==============
echo ================================================================================
echo ============================= https://t.me/Dimokus =============================
echo ================================================================================
sleep 5
echo ================================================================================
echo ================================================================================
echo ██████╗░░█████╗░░██╗░░░░░░░██╗███████╗██████╗░███████╗██████╗░  ██████╗░██╗░░░██╗
echo ██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝
echo ██████╔╝██║░░██║░╚██╗████╗██╔╝█████╗░░██████╔╝█████╗░░██║░░██║  ██████╦╝░╚████╔╝░
echo ██╔═══╝░██║░░██║░░████╔═████║░██╔══╝░░██╔══██╗██╔══╝░░██║░░██║  ██╔══██╗░░╚██╔╝░░
echo ██║░░░░░╚█████╔╝░░╚██╔╝░╚██╔╝░███████╗██║░░██║███████╗██████╔╝  ██████╦╝░░░██║░░░
echo ╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚══════╝╚═════╝░  ╚═════╝░░░░╚═╝░░░
sleep 1
echo ====================░█████╗░██╗░░██╗░█████╗░░██████╗██╗░░██╗=====================
echo ====================██╔══██╗██║░██╔╝██╔══██╗██╔════╝██║░░██║=====================
echo ====================███████║█████═╝░███████║╚█████╗░███████║=====================
echo ====================██╔══██║██╔═██╗░██╔══██║░╚═══██╗██╔══██║=====================
echo ====================██║░░██║██║░╚██╗██║░░██║██████╔╝██║░░██║=====================
echo ====================╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝=====================
sleep 10
echo 'export POOL='${POOL} >> $HOME/.bashrc
echo 'export MNEMONIC='${MNEMONIC} >> $HOME/.bashrc
echo 'export STAKE='${STAKE} >> $HOME/.bashrc
echo 'export LINK_ARWEAVE_WALLET='${LINK_ARWEAVE_WALLET} >> $HOME/.bashrc
source $HOME/.bashrc


git clone https://github.com/kyve-org/kysor.git
cd kysor
mkdir /kysor/secrets
wget -O /kysor/secrets/arweave.json ${LINK_ARWEAVE_WALLET}
echo $MNEMONIC > /kysor/secrets/1.txt
tr -d '\n' < /kysor/secrets/1.txt > /kysor/secrets/mnemonic.txt
rm /kysor/kysor.conf.ts

cat > /kysor/kysor.conf.ts <<EOF
import { IConfig } from "./src/faces";

const config: IConfig = {
  // target of the host machine, can be either "linux" or "macos"
  // important for downloading the correct binaries
  hostTarget: "linux",

  // whether KYSOR should auto download new binaries
  // if set to false, you have to insert the binaries manually
  autoDownload: true,

  // whether KYSOR should verify the checksums of downloaded binaries
  // if autoDownload is false this option can be ignored
  verifyChecksums: true,

  // settings for protocol node
  // notice that mnemonic and keyfile is missing, those need to be files under the secrets directory
  protocolNode: {
	// the ID of the pool you want to join as a validator
    // an overview of all pools can be found here -> https://app.kyve.network
    poolId: `echo $POOL`,

    // the network you want to run on
    // currently only the testnet network "korellia" is available
    network: "kyve-beta",

    // the amount of $KYVE you want to stake
    // will only get applied if you are not a validator yet
    // once you are a validator you can manage your stake in the KYVE app
    initialStake: `echo $STAKE`,

    // the amount of bytes the node can use at max to cache data
    // 1000000000 equals 1 GB which is usually enough
    space: 1000000000,

    // specify verbose logging
    // is often recommended in order to have a more detailed insight
    verbose: true,
  },
};

export default config;
EOF

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
apt-get install yarn -y
yarn install
yarn build
yarn start
