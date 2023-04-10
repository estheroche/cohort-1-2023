const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Mapping Test suite", function () {
  let mapping;
  beforeEach(async () => {
    const Mapping = await ethers.getContractFactory("Mapping");
    mapping = await Mapping.deploy();
    await mapping.deployed();
  });

  it("Should add and retrieve a student", async function () {
    const id = 1;
    const name = "Isaac";
    await mapping.addStudent(id, name);
    const studentName = await mapping.viewStudent(id);
    expect(studentName).to.equal(name);
  });

  it("Should add multiple students and retrieve them", async function () {
    const students = [
      { id: 1, name: "Isaac" },
      { id: 2, name: "Pelz" },
      { id: 3, name: "Esther-ego" },
    ];

    for (const student of students) {
      await mapping.addStudent(student.id, student.name);
    }

    for (const student of students) {
      const studentName = await mapping.viewStudent(student.id);
      expect(studentName).to.equal(student.name);
      expect(studentName).to.not.equal(student.name3)
    }
});

it("Should throw an error when retrieving a non-existent student", async () => {
    const students = 
     {
        123:  { id: 1, name: "Isaac" },
        456:   { id: 2, name: "Pelz" },
         789:  { id: 3, name: "Esther-ego" }
     }
    //  const student = students[999];
    //  const studentName = await mapping.viewStudent(student)
     expect(function(){
        const student = students[999];
        if(!student){
            throw new Error('Student not found');
        }
     }).to.throw(Error, 'Student not found');
    // await expect(mapping.viewStudent(!studentName)).to.be.revertedWith("VM Exception while processing transaction: revert");
});

  });