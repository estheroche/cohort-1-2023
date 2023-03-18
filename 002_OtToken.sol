// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; // importing ERC20 contract from OpenZeppelin library

contract OtToken is ERC20{ // defining a new contract called OtToken that inherits from ERC20

    constructor(uint256 initialSupply ) ERC20("OTToken", "OTK"){ // constructor function that takes an initial supply argument
        _mint(msg.sender, initialSupply); // calling the _mint function from the inherited ERC20 contract to mint tokens
    }

    //EXTRA FUNCTION ADDITION : EXAMPLE
    // function payToMint() external payable{
    //     require(msg.value > 2 ether);
    //     _mint(msg.sender, 1000);
    // }

}
