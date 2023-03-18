//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// A contract that demonstrates global variables in Solidity
contract GlobalVariables{

    // Define variables that represent different units in Solidity
    uint amount = 1 wei;
    uint amount2 = 1 gwei;
    uint amount3 = 1 ether;
    uint time1 = 1 seconds;
    uint time2 = 1 minutes;
    uint time3 = 1 hours;
    uint time4 = 1 days;
    uint time5 = 1 weeks;

    // Create an array of the different units for easier access
    uint[] units = [amount, amount2, amount3, time1, time2, time3, time4, time5];

    // A function that returns the array of units
    function getUnits() external view returns(uint[] memory){
        return units;
    }
}
