// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import the contract we would be calling
import "./IdGenerator.sol";

contract ContractCaller {
    // Address of contract we are interfacing
    address IIdGen;

    constructor(address _IIdgen) {
        IIdGen = _IIdgen;
    }

    // Function to get the current Id from the IdGenerator contract
    function getCurrentId() external view returns (uint) {
        uint currentId = IdGenerator(IIdGen).id();
        return currentId;
    }

    // Function to double the Id from the IdGenerator contract
    function doubleId() external {
        IdGenerator(IIdGen).exponentiate();
    }
}
