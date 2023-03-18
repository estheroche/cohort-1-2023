// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Contract to demonstrate string comparison in Solidity
contract Strings {
    // Define two string variables
    string name = "John";
    string name2 = "James";

    // Function to compare the two string variables
    function compareTwoStrings() external view returns (bool) {
        // To compare two strings in Solidity, we hash the strings using keccak256
        // First we encode the strings using the `abi.encodePacked` function, then hash the result using `keccak256`
        bool isEqual = keccak256(abi.encodePacked(name)) ==
            keccak256(abi.encodePacked(name2));

        // Return the result of the string comparison
        return isEqual;
    }
}
