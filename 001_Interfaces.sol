// SPDX-License-Identifier: MIT
// The above line specifies the license for this contract

pragma solidity ^0.8.17;

// A contract that generates unique ids
contract IdGenerator{
    // A public state variable that stores the current id
    uint public id = 0;
    
    // A function that increments the id
    function increment() external {
        id +=1;
    }
}

// An interface for the IdGenerator contract
interface IIdGenerator{
    // A function to retrieve the current id (declared as an external view function)
    function id() external view returns(uint);

    // A function to increment the id (declared as an external function)
    function increment() external;
}

// A contract that uses the IdGenerator interface to retrieve the current id
contract Interfaces{
    // The address of the contract that implements the IIdGenerator interface
    address IIdGen;

    // Constructor function that sets the address of the contract
    constructor(address _IIdgen){
        IIdGen = _IIdgen;
    }

    // A function that retrieves the current id from the IIdGenerator contract
    function getCurrentId() external view returns(uint){
       // Call the id function from the IIdGenerator contract through the interface
       uint currentId = IIdGenerator(IIdGen).id();
       return currentId;
    }
}
