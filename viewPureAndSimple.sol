// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract viewPureAndSimple{
uint public age = 20;

function viewFun() public view returns(uint){
    return age+10;
}

function pureFun() public pure returns(uint){
    return 1;
}

function simpleFun() public{
    age = age+10;
}


} 