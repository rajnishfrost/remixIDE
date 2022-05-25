// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mapping{
    mapping(uint=>string) public empId;

    function setIds() public{
        empId[31]="rj";
        empId[21]="gj";
        empId[11]="yj";
        empId[1]="tj";

    }
}

struct donar_dts{
    string name;
    uint age;
    string add;
    uint don;
}
    contract advanceMapping{
        mapping(address=>donar_dts) public acc_info;

        function set(string memory _name , uint _age , string memory     _add , uint _don) public{

            acc_info[msg.sender]=donar_dts(_name,_age,_add,acc_info[msg.sender].don+_don);
        }

        function delete_info()public{
            delete acc_info[msg.sender];
        }
    }
