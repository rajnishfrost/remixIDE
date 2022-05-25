// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract structure{

    struct myDT{
        string name;
        uint age;
        address acc;
    }
    myDT public a;
    myDT[] public array;
    function setValue() public
    {
      myDT memory b;
      b.name = "rj";
      b.age=22;
      b.acc=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
      myDT memory c =myDT("dj",23,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

      array.push(b);
      array.push(c);
    }

}