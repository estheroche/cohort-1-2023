const {
    time,
    loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Storage Test Suite", async () => {
    const { parseEther, formatEther } = await ethers.utils;

    let owner, addr1, addr2, storageContract

    beforeEach(async () => {
        [owner, addr1, addr2] = await ethers.getSigners();
        const StorageContract = await ethers.getContractFactory("Storage")
        storageContract = await StorageContract.deploy(owner.address)
        console.log("storage contract address", storageContract.address)
    })

    describe("Deployment", async () => {
        it("should set the right owner", async function () {
            console.log("owner _", owner.address)
            expect(await storageContract.owner()).to.equal(owner.address);
            expect(await storageContract.owner()).to.not.equal(addr1.address)
            expect(await storageContract.owner()).to.not.equal(addr2.address)
        });

        it("should set only owner to change number", async function () {
            // const value1 = await parseEther("100")
            const value1 = 100
            // const changeNumberTxn = await storageContract.changeNumber(value1)
            await storageContract.connect(owner).changeNumber(value1)
            // await changeNumberTxn.wait()
            const number = await storageContract.number()
            // console.log("stored number__", formatEther(value1))
            expect(number).to.eq(value1)
            expect(number).to.not.eq(0);

        });

        it("Should revert if changeNumber is called ny another address other than owner", async () => {
          await expect(storageContract.connect(addr1).changeNumber(23)).to.be.revertedWith("Only the contract owner can change the number")
        })
    })


});

            
        it("should return myAddress in Storage contract", async function () {
            const storedMyAddress = "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
            expect(await storageContract.viewAddress()).to.eq(storedMyAddress)
            expect(await storageContract.viewAddress()).to.not.eq(addr2.address)
        });
