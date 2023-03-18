// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EtherWallet {
    // Declare a public variable to store the owner's address
    address public owner;

    // Define the constructor to initialize the owner's address with the address that deploys the contract
    constructor() {
        owner = payable(msg.sender);
    }

    // Use the receive() function to enable the contract to receive ether
    receive() external payable {}

    // Define a function to withdraw a specified amount of ether from the contract's balance to the owner's address
    function withdraw(uint _amount) external {
        // Check if the caller is the owner of the contract, and revert the transaction if not
        if (msg.sender != owner) {
            revert("Not owner");
        }
        
        // Attempt to send the specified amount of ether to the owner's address
        (bool success, ) = payable(owner).call{value: _amount}("");
        
        // Check if the transfer was successful, and revert the transaction if not
        if (!success) {
            revert("Unsuccessful");
        }
    }

    // Define a function to get the current balance of the contract
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
