// SPDX-License-Identifier:  MIT
pragma solidity 0.8.17;

// Define a contract representing a student
contract Student{
    address public studentAddress; // The address of the student contract
    string public studentName; // The name of the student
    uint public studentId; // The student ID
    
    // Constructor to set initial values for name and ID
    constructor(string memory _studentName, uint _studentId){
        studentId = _studentId;
        studentName = _studentName;
        studentAddress = address(this); // Set the address of this contract as the student address
    }

}

// Define a contract representing the registration system
contract Registration{
    Student[] public students; // An array of student contracts

    // Function to register a new student by creating a new student contract and adding it to the students array
    function register(string memory _studentName, uint _studentId) external{
        // Create a new instance of the Student contract
        Student tempStudent = new Student(_studentName, _studentId);
        // Add the new student contract to the students array
        students.push(tempStudent);
    }

    // Function to get the details of a student given an index in the students array
    function getStudentDetails(uint _index) external view returns(address, string memory, uint){
        // Get the student contract at the given index in the students array
        Student studentContract = students[_index];
        // Call the student contract to get its state variables
        address _studentAddress = studentContract.studentAddress();
        string memory _studentName = studentContract.studentName();
        uint _studentId = studentContract.studentId();

        // Return the student's details
        return(_studentAddress, _studentName, _studentId);
    }
}
