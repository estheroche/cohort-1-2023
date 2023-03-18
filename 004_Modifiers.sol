//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Modifiers{
    // Declare some state variables to use as examples.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set the contract deployer as the initial owner.
        owner = msg.sender;
    }
    
    // Define a modifier that checks if the message sender is the owner of the contract.
    modifier OnlyOwner{
        require(msg.sender == owner, "Not owner");   
        _; // The underscore indicates where the function code should be inserted.
    }
    
    // Define a modifier that checks if an address is not the zero address.
    modifier AddressCheck(address _addr){
        require(_addr != address(0), "Address is address 0");
        _; // The underscore indicates where the function code should be inserted.
    }

    // Define a function that changes the contract owner, and apply the modifiers to it.
    function changeOwner(address _newOwner) public OnlyOwner AddressCheck(_newOwner){
        owner = _newOwner;
    }
}
