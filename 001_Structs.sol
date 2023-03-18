// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Structs {
    // Defining a struct to represent a student
    struct Student {
        address addr; // Ethereum address of the student
        string name; // Name of the student
        uint id; // Unique identifier for the student
        bool isMale; // Gender of the student
        string lang; // Preferred language of the student
    }

    // Defining an array to store a list of students
    Student[] public students;

    // Function to add a new student to the list
    function addNewStudent(
        address _addr,
        string memory _name,
        uint _id,
        bool _isMale,
        string memory _lang
    ) external {
        Student memory tempStruct = Student(_addr, _name, _id, _isMale, _lang);
        students.push(tempStruct);
    }

    // Function to retrieve the data of a specific student by index
    function getStudentData(
        uint _index
    ) external view returns (Student memory) {
        return (students[_index]);
    }

    // Function to retrieve the ID of a specific student by index
    function getStudentId(uint _index) external view returns (uint) {
        return (students[_index].id);
    }
}
