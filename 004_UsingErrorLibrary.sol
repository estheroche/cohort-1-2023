// SPDX-License-Identifier: MIT
// The above line specifies the license for this contract

pragma solidity ^0.8.17;

// Import the ErrorCheckLibrary
import "./003_ErrorLibrary.sol";

// The contract UsingLibrary
contract UsingLibrary{
    // A state variable to store the contract owner
    address public owner;
    // A state variable to store an unsigned integer
    uint public x = 10;
    // A state variable to indicate whether or not the contract is locked
    bool public locked;

    // A constructor that sets the owner variable to the address of the sender
    constructor() {
        owner = msg.sender;
    }

    // A function to change the contract owner
    function changeOwner(address _newOwner) public returns(bool){
        // Call the checkZeroAddress function from the ErrorCheckLibrary and store the result in a boolean variable
        bool isZeroAddress = ErrorChecker.checkZeroAddress(_newOwner);
        // Set the owner variable to the new owner address
        owner = _newOwner;
        // Return the result of the checkZeroAddress function
        return isZeroAddress;
    }
}
