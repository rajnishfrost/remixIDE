// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract _constructor{
    uint public age;
    address public owner;
    string public str;
    constructor (uint _age , address _owner , string memory _str){
        age = _age;
        owner = _owner;
        str = _str;
    }
}