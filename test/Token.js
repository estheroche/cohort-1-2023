const {expect} = require("chai");
const { ethers } = require("hardhat");
const hre = require("hardhat");

describe("Token", function () {
  it("Deployment should assign the correct amount of tokens to the owner", async function () {
    const [deployer] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const token = await Token.deploy();

    const deployerBalance = await token.balanceOf(deployer.address);
    expect(await token.totalSupply()).to.equal(deployerBalance)
  });

  it("Should transfer the correct amount to the second account", async function () {
    const [owner, acc1, acc2] = await ethers.getSigners()

    const Token = await ethers.getContractFactory("Token");

    const token = await Token.deploy();

    // Transfer 99 tokens to acc1 from owner
    await token.transfer(acc1.address, 99);
    expect(await token.balanceOf(acc1.address)).to.equal(99);

    // Transfer 49 tokens from acc1 to acc2
    await token.connect(acc1).transfer(acc2.address, 49);
    expect(await token.balanceOf(acc2.address)).to.equal(49)
  });
  
  it ("Should set the correct owner", async function () {
    const [deployer] = await ethers.getSigners()

    const Token = await ethers.getContractFactory("Token");

    const tokenContract = await Token.deploy();

    expect(await tokenContract.owner()).to.be.equal(deployer.address)
  })
});