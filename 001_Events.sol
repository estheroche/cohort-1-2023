// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Events{
    // Define our event
    // Indexed arguments are easier to access
    event Withdrawal(address indexed receiver, uint indexed amount);

    function withdrawFunds() public {
        // The withdraw logic
        (bool success, ) = payable(msg.sender).call{value: 0}("");
        
        // Emit the event
        emit Withdrawal(msg.sender, 0);
    }
}
