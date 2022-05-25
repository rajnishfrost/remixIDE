// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract a{
    function _external() external pure returns(string memory str){
        return str="devidIsLive";
    }
    
}


contract b{
    a obj =new a();
function another() public view returns(string memory str2){
    str2=obj._external();
}
}