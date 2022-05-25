// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract fallbackAndReceive{
    event log(string _fun , address _sender , uint _val , bytes _data);
    fallback() external payable{
        emit log("fallback",msg.sender,msg.value,msg.data);
    }
    receive() external payable{
        emit log("recieve",msg.sender,msg.value,"");
    }
}