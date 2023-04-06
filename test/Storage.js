const {
    time,
    loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Storage Test Suite", async () => {
    let owner, addr1, addr2, storageContract

    beforeEach(async () => {
        [owner, addr1, addr2] = await ethers.getSigners();
        const StorageContract = await ethers.getContractFactory("Storage")
        storageContract = await StorageContract.deploy(owner.address)
        console.log("storage contract address__", storageContract.address)
    })

    describe("Deployment", async () => {
        it("should set the right owner", async function () {
            console.log("owner ___", owner.address)
            expect(await storageContract.owner()).to.equal(owner.address);
            expect(await storageContract.owner()).to.not.equal(addr1.address)
            expect(await storageContract.owner()).to.not.equal(addr2.address)
        });
    })


});
