// SPDX-License-Identifier: MIT
// The above line specifies the license for this library

pragma solidity ^0.8.17;

// The library ErrorChecker
library ErrorChecker{
    // A public pure function that checks if an address is zero (0x0)
    function checkZeroAddress(address _addr) external pure returns(bool){
        if(_addr == address(0)){
            return true;
        }
        // If the address is not zero, return false
        return false;
    }
}
