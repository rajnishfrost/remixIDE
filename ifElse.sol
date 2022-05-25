// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract ifElse{
    function fun(uint _x) public pure returns(string memory str){
        if(_x >100)
        str = "Greater Than 100";
        else if (_x < 100)
        str = "Lesser Than 100";
        else
        str = "Equal To 100";
        return str;
    }
}