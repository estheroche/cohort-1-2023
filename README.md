# NFT Dapp 1

NFT minter decentralised application

## Getting started

- Clone the repository by running the command:
```bash
git clone https://github.com/BlockheaderWeb3-Community/cohort-1-2023.git
```
_Please ensure you have Git installed before running the above command and subsequent commands_

- Switch to the `nft-dapp-1` branch by running the command: 

```bash
git checkout origin/nft-dapp-1
```
- Then install dependencies by running the command 

```bash
npm install 
```

- Compile the contracts using the command
````bash
npx hardhat compile
````

- To deploy, run the command:

```bash
npx hardhat run scripts/deploy.js --network mumbai


```

> **Note** Please ensure to create a `.env` file in your project directory and add your secret keys before running the deployment command. Check out the `.env-sample` file to see how to structure your `.env` file.


To learn more about Hardhat, check out the [Hardhat documentation](https://hardhat.org/hardhat-runner/docs/getting-started)
