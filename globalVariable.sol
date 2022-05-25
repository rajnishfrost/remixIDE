// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract globalVariable{
    address public myAddress = msg.sender;
    uint public time = block.timestamp;
    uint public diff = block.difficulty;
    uint public gasCost = tx.gasprice;
}