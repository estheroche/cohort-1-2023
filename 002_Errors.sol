// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Contract for demonstrating various error handling techniques
contract Errors {
    // public array of user addresses
    address[] public users;

    // function for adding a new user to the array
    function addUser(address _addr) external {
        // require statement to check that the address being added is not the zero address
        require(_addr != address(0), "WE DON'T ACCEPT ZERO ADDRESS");

        // if statement to check that the address being added is not the zero address and revert with an error message if it is
        if(_addr == address(0)){
            revert("ZERO ADDRESS WAHALA");
        }

        // assert statement to check that the address being added is not the zero address, and revert the transaction if it is (this should never happen if the require statement above is working correctly)
        assert(_addr != address(0));

        // if the address is not the zero address, add it to the array
        users.push(_addr);
    }
}
