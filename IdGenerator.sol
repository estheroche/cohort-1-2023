// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IdGenerator {
    uint256 public id = 0;

    function increment() external {
        id += 1;
    }

    function exponentiate() external {
        id = id * id;
    }
}
