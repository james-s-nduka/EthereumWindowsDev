# Ethereum Smart Contract Development Environment for Windows

A comprehensive guide for setting up your Windows 64bit workstation to begin developing, building and testing Smart Contracts.

## Requirements
In order to begin development you will need the following;

* Visual Studio Code: https://code.visualstudio.com/ 
* The Solidity extension installed for Visual Studio Code
* OpenSSL Win64 libraries which can be downloaded here; https://slproweb.com/products/Win32OpenSSL.html
* Git Shell or Git Bash https://git-for-windows.github.io/ 

### Helpful Links
* The online Solidity compiler: https://ethereum.github.io/browser-solidity
* Truffle Documentation: http://truffleframework.com/docs/ 

## Setup Instructions
1. Clone this repository to your machine
2. Open Powershell and navigate to the directory of the cloned repo then execute the following;
```
powershell .\Install-Truffle.ps1 
```
This will download & install the latest version of **Node.JS** and the required npm modules for Ethereum development; **TestRPC** & **Truffle**.

3. Upon successful execution of the powershell script,ensure the path ```C:\npm``` is an entry in the User's environment variables;

![Screenshot](img001.png)

4. Restart your terminal console (GitShell/GitBash/Powershell etc)

5. To confirm the components were installed and configured correctly type ```truffle version``` in the terminal prompt and hit enter. This should return output similiar to this;
```
Truffle v3.4.11 (core: 3.4.11)
Solidity v0.4.15 (solc-js)
```
6. Congratulations - You are now ready to build your first Ethereum Smart Contract.

## Smart Contract Development Workflow
Truffle with TestRPC provides us with an **Ethereum network simulator** which is fast, free and private. Ideally, you will want to confirm your contract is bug free and meets it's requirements before deploying it to the ```testnet``` which is still free however public and up for scrutiny. Once satisfied and ready to execute the contract in the **live(the real)** Ethereum network, we will deploy to the ```mainnet```.

### Let's Start
In the ```Essentials``` directory you should see a folder structure like this;

```
.
├── contracts
│   ├── ConvertLib.sol
│   ├── HelloWorld.sol
│   ├── MetaCoin.sol
│   └── Migrations.sol
├── migrations
│   ├── 1_initial_migration.js
│   └── 2_deploy_contracts.js
├── test
│   └── metacoin.js
└── truffle.js
```

This is the result of executing ```truffle init``` inside of this directory. Truffle will create all the files for an example project, including contracts for ```MetaCoin```, a sample token contract. You should now start by creating your own contract in a different folder, executing ```truffle init``` in that folder's root.

Run ```testrpc``` in a new terminal and leave it running while you develop. Each time you run testrpc, it will generate 10 new addresses with simulated test funds for you to use. **IMPORTANT** Ensure you have no other services listening or forwarded to the RPC port which is 8545.

![Screenshot](img002.png)

Let that terminal window stay open while navigating to the root of YOUR contracts folder in a **new** console.

You should be able to compile the example contracts by running ```truffle compile```. 

Then, to deploy the contracts to the simulated network. We need to first modify the ```\migrations\2_deploy_contracts.js``` file to instruct truffle the contract(s) to deploy to our local development network (see the example in the Essentials folder).

Once that is done, you need to run ```truffle migrate```:

```
> truffle migrate
Using network 'development'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0x8f0ce73af488018dd718aa8c749defe93523bd7923bbfefb8dbe9dedc06bdbeb
  Migrations: 0x1afd4f4bc46017861c221869e18da61ff8470691
Saving successful migration to network...
  ... 0x24ce548bb17c17ce6f5ac0f77eebff9d046eae08642ffa9aa83d4fc704e53736
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying HelloWorld...
  ... 0x6dddcb9c6693aa019fa379e782f53544dee666c890367867488e16968dea8ae5
  HelloWorld: 0xcf25e0ad79727b0f0312bb6b3a457480fbe1707d
Saving successful migration to network...
  ... 0xb28e0ddb6d74553e42e9f32c103e9d1ed093683c5c328ad715a7fb0e45de4508
Saving artifacts...
```



## License and Authors

Authors: James Nduka 