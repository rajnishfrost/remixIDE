// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract ternaryOperator{

    function fun(uint _x) public pure returns(string memory str){
        _x>100?str="This Is Greater Than 100":str="This Lesser Than Or Equal to 100";
    }
}