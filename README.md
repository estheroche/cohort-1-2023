# Intro to testing using Hardhat

This branch contains all the files needed for testing smart contracts locally using Hardhat

## Getting Started

To test this project locally, first clone this repo by running this command:

```bash
git clone https://github.com/BlockheaderWeb3-Community/cohort-1-2023.git
```
_Please ensure you have [Git installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) before running the above command and subsequent commands_

Then switch to the `intro-to-testing` branch by running the command: 

```bash
git checkout origin/intro-to-testing
```
Then install dependencies by running the command 

```bash
npm install 
```

## Testing contracts

To test the contracts located in `contracts/` folder, run the command:
```bash
npx hardhat test
```
The above command will run all the test scripts located inside `test/` folder.


To learn more about testing smart contracts with Hardhat, check out the [Hardhat documentation](https://hardhat.org/tutorial/testing-contracts)
