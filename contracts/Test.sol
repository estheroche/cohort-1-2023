// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "hardhat/console.sol";
/**
 * @title Test
 * @dev Sets and Gets a uint variable called Pointer
 */
contract Test{

    // uint256 public pointer; 
    uint256 public pointer = 10; 
      uint dnaDigits = 16;
    // uint dnaModulus = 10 ** dnaDigits;
    uint dnaModulus = 1e16;
    // 10000000000000000
    // 10000000000000000


    constructor() {
        pointer = 100;
    }

    function setPointer(uint256 _num) public {
        pointer = _num;
    }

    function getPointer() external view returns (uint256) {
        return pointer;
    }

    function generateRandomDna(string memory _str) public view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        console.log("rand %s", rand);
        return rand % dnaModulus;
    }
    function generateRandomNumber(uint number) public view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(number, block.difficulty, block.timestamp)));
        console.log("rand %s", rand);

        console.log("dna modulus___", dnaModulus);
        return rand % dnaModulus;
    }


    function concatStrings(string memory fName, string memory lName) public pure returns(string memory) {
        string memory concatStringResult = string(abi.encodePacked(fName, " ", lName));
        return concatStringResult;
    }

    function convertStringToBytes(string memory fName, string memory lName) public pure returns(bytes32) {
       bytes32 result = keccak256(abi.encodePacked(fName, lName));
       return result;
    }

} 

