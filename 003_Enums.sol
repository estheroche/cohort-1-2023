// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Enum{
    // enum represents user-defined states
    enum Status{
        Unapproved,
        Pending,
        Approved
    }
    Status public loanState;

    // mapping an address to an enum
    mapping(address => Status) public userState;
    // mapping for address to amount paid 
    mapping(address => uint) public userBalance;

    // getter function for loanState
    function get() public view returns(Status){
        return loanState;
    }

    // function to set loanState to Pending
    function makePending() public {
        loanState = Status.Pending;
    }

    // function to set loanState to Approved
    function makeApproved() public {
        loanState = Status.Approved;
    }

    // function for users to apply for a loan and store the amount paid
    function applyLoan() payable public{
        userBalance[msg.sender] = msg.value;
        userState[msg.sender] = Status.Pending;
    }

    // function for the contract to pay out a loan to a user
    function payout() public returns(bool){
        // calculate amount to be paid out
        uint amount = (userBalance[msg.sender])/2;

        // set state to Approved and balance to 0
        userBalance[msg.sender] = 0;
        userState[msg.sender] = Status.Approved;

        // transfer payout to user
        address _to  = payable(msg.sender);
        (bool sent,) = _to.call{value: amount}("");
        return sent;
    }
}
