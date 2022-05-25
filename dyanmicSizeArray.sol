// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract dynamicSizeArray{
    uint [] public a = [1,2,3,4,5];
    
    function fun() public {
        uint temp =a[3];

        a[4]=23;

        delete a[2];

        a.push(32);
    }
}