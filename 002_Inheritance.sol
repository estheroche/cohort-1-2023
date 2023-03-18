// SPDX-License-Identifier: MIT
// The above line specifies the license for this contract

pragma solidity ^0.8.17;

// The contract ConstructorA
contract ConstructorA{
    // A state variable to store the total supply
    uint totalSupply;

    // A constructor that sets the total supply
    constructor(uint _totalSupply){
        totalSupply = _totalSupply;
    }

    // A public view function to return the total supply
    // The 'virtual' keyword allows child contracts to override this function
    function getTotalSupply() public view virtual returns(uint){
        return totalSupply;
    }
}

// The contract ConstructorB, which inherits from ConstructorA
contract ConstructorB is ConstructorA{
    // A state variable to store the accumulated supply
    uint accSupply;

    // A constructor that sets the accumulated supply and calls the constructor of ConstructorA
    constructor(uint _accSupply) ConstructorA(1000){
        accSupply = _accSupply;
    }

    // A public view function to return the total supply, which overrides the same function in ConstructorA
    function getTotalSupply() public view override returns(uint){
        // The 'super' keyword refers to the parent contract (ConstructorA in this case)
        uint parentSupply = super.getTotalSupply();
        return accSupply + parentSupply;
    }
}
