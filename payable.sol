// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Payable{
// address payable public addressPayable = payable(msg.sender);
    function getEth() payable public{

    }
    // constructor()payable {
    //  }
 function checkEth() public view returns(uint){
     return address(this).balance;
    }
}