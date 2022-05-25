// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0 ;

contract loops{

    function loop(uint _x)public pure returns(uint){
        uint count =0;

        for(uint i=0;i<_x;i++){
            count++;
        }
        return count;
    }
}