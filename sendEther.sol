// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract sendEther{
    address payable public getter = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    
    receive() external payable{

    }

    function checkBal() public view returns(uint){
        return address(this).balance;
    }

    function SEND() public{
        bool sent = getter.send(1000000000000000000);
        require(sent,"transaction failed");
    }

    function TRANSFER() public{
        getter.transfer(1000000000000000000);
    }

    function CALL() public {
           (bool sent,) =  getter.call{value:1000000000000000000}("2000");
           require(sent,"transaction failed");
    }
}