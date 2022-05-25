// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Immutable{

    constructor(address _a){
    owner=_a; 
    }
    address public immutable owner;
}