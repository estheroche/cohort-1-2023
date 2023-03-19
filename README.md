# Deployment to Testnet

This branch contains a simple Hardhat project that provides capabilities for deploying contracts to Goerli testnet

## Testing locally
To test this project locally, first clone this repo by running this command:

```bash
git clone https://github.com/BlockheaderWeb3-Community/cohort-1-2023.git
```
_Please ensure you have Git installed before running the above command and subsequent commands_

Then switch to the `deployment-to-testnet` branch by running the command: 

```bash
git checkout origin/deployment-to-testnet
```
Then install dependencies by running the command 

```bash
npm install 
```

**Note**

For a successful deployment, please take note of the following:

1. Add your private key and Alchemy API key (Goerli testnet) to the `.env` file. To get an API key, go to https://dashboard.alchemy.com/ to create an API key (On Goerli testnet please) and paste the key inside the `.env` file.
2. Please ensure you have some Goerli ETH in your account to pay for gas fees during deployment.

To deploy, run the command:

```bash
npx hardhat run scripts/deploy.js --network goerli
```


To learn more about Hardhat, check out the [Hardhat documentation](https://hardhat.org/hardhat-runner/docs/getting-started)
