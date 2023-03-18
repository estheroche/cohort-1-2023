// SPDX-License-Identifier: MIT
// The above line specifies the license for this contract

pragma solidity ^0.8.17;

// The contract EncodingAndDecoding
contract EncodingAndDecoding{
    
    // A function to encode a string into a byte array
    function encode(string memory _info) public pure returns(bytes memory){
        // Call the abi.encode function with the string parameter and return the result
        return abi.encode(_info);
    }

    // A function to decode a byte array into a string
    function decode(bytes memory _encd) public pure returns(string memory){
        // Call the abi.decode function with the byte array parameter and the type of the expected output (string) and return the result
        return abi.decode(_encd, (string));
    }
}
