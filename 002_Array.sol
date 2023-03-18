// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Define the contract
contract Array{

    //disclaimer: CODE NOT OPTIMIZED PROPERLY ESPECIALLY THE DELETE PERMANENTLY FUNCTION , DO NOT USE FOR PRODUCTION OR MAINNET 

    // Define a dynamic array of uint IDs
    uint[] public ids;

    // Define a dynamic array of Ethereum addresses
    address[] users;

    // Define a fixed-length array of 10 uints
    uint[10] public fixedId = [1,2,3,4,5,5,6,78,9,0];

    // Define a dynamic array with initial values
    uint[] public defaultVal = [1, 2, 3];

    // Add a new address to the users array
    function addUsers(address _addr) public{
        users.push(_addr);
    }

    // Remove the last address from the users array
    function removeLastUser() public{
        users.pop();
    }

    // Get the length of the users array
    function getArrLength() public view returns(uint){
        return users.length;
    }

    // Get all addresses in the users array
    function getAllUsers() public view returns(address[] memory){
        return users;
    }

    // Remove a specific address from the users array
    function removeUser(address _addr) public {
        // Get the index of that particular address
        uint index = getUserIndex(_addr);
        // Use the delete keyword to delete it
        delete users[index];
    }

    // Remove a specific address permanently from the users array
    function removePermanently(address _addr) public {
        // Get the index of that particular address
        uint index = getUserIndex(_addr);
        // Store the last user temporarily
        address temp = users[users.length - 1];
        // Swap the to-be-deleted address with the last user
        users[users.length -1] = users[index];
        // Swap the last user with the position of the to-be-deleted address
        users[index] = temp;
        // Remove the last user from the array
        removeLastUser();
    }

    // Get the index of a specific address in the users array
    function getUserIndex(address _addr) private view returns(uint){
        for(uint i=0; i< users.length; i++){
            if(users[i] == _addr){
                return i;
            }
        }
        return 0;
    }
}
