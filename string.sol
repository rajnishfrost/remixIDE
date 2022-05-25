// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract _string{
    string public str = "Dj";

    function localVariable() public pure returns(string memory) {
        string memory str2 = "Rj";
        return str2;
    }
}