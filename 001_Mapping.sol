// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Define the contract
contract Mappings{

    // Define a mapping from uint IDs to student names
    mapping(uint => string) students;

    // Define a mapping from Ethereum addresses to balances
    mapping(address => uint) public balances;

    // Define mappings to link uint IDs and Ethereum addresses
    mapping(uint => address) public idToUser;
    mapping(address => uint) public userToId;
    uint id = 0; // Initialize the ID counter

    // Add a new student to the students mapping
    function addStudent(uint _id, string memory _name) public{
        students[_id] = _name;
    }

    // Update the balance associated with the sender's address
    function updateBalance(uint _amount) public returns(address){
       balances[msg.sender] += _amount;
       return msg.sender;
    }

    // View the name associated with a given student ID
    function viewStudent(uint _id) public view returns(string memory){
        string memory studentName  = students[_id];
        return studentName;
    }

    // Add a new address to the ID-to-address and address-to-ID mappings
    function addAddress(address _addr) public{
        id++; // Increment the ID counter
        idToUser[id] = _addr; // Map the ID to the address
        userToId[_addr] = id; // Map the address to the ID
    }

    // Remove an address from the ID-to-address and address-to-ID mappings
    function removeAddress(uint _id) public{
        // Save the address stored to the ID
        address temp = idToUser[_id];
        // Remove the address tied to the ID
        idToUser[_id] = address(0);
        // Remove the ID tied to the address
        userToId[temp] = 0;
    }
}
