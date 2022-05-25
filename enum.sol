// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Enum{
    enum myEnum{
        accept,
        reject,
        pending,
        shipped,
        delivered
    }
    myEnum a;

    function getStatus() public view returns(myEnum){
        return a;
    }

      function setStatus(myEnum _b) public{
       a=_b;
    }

     function Accept() public{
      a=myEnum.accept;
    }

    function Reject() public{
      a=myEnum.reject;
    }

    function Pending() public{
      a=myEnum.pending;
    }
    
    function Shipped() public{
      a=myEnum.shipped;
    }

    function Delivered() public{
      a=myEnum.delivered;
    }
}
