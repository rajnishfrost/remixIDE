// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ERC20 {

    function name() external view returns (string memory );
    function symbol() external view returns (string  memory);
   // function decimals() external view returns (uint8);

    function totalSupply() view external returns (uint256);
    function balanceOf(address _owner) view external returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) view external returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract Ownership{
    address public contractOwner;
    address public newOwner;

    event TransferOwnership(address indexed _from , address indexed _to);
    
    constructor(){
        contractOwner = msg.sender;
    }

    function changeowner(address _to) public{
        require(msg.sender == contractOwner , 'Only Owner Of The Contract Can Execute it');
        contractOwner = _to;
    }

    function acceptOwner() public{
        require(msg.sender == newOwner,'Only new Assigned Owner Can Call It');
        emit TransferOwnership (contractOwner , newOwner);
        contractOwner = newOwner;
        newOwner = address(0); 
    }
}

 contract RjERC is ERC20{
     
    string public _name;
    string public _symbol;
    uint256 public _decimals=1;
    uint256 public _totalSupply;
    address public _minter; 
    mapping (address=>uint256) tokenBalances;
    mapping (address=>mapping(address=>uint256)) allowed;

    constructor(){
     _name='RajnishCoin';
     _symbol='Rjf';
     _totalSupply=1000; 
     tokenBalances[msg.sender] = _totalSupply; 
    }

    function name() public override view returns (string memory ){
        return _name;
    }
    function symbol() public override view returns (string  memory){
        return _symbol;
    }
    function totalSupply() public view override returns (uint256){
        return _totalSupply;
    }
    function balanceOf(address _owner) public view override returns (uint256 balance){
        return tokenBalances[_owner];
    }
    function transfer(address _to, uint256 _value) public override returns (bool success){
        require(tokenBalances[msg.sender] >= _value , 'Insufficient Token ');
        tokenBalances[msg.sender] -=_value;
        tokenBalances[_to] += _value;
        emit Transfer(msg.sender , _to , _value);
    }
    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success){
       uint256 allowedBal = allowed[_from][msg.sender];
        require(allowedBal >= _value , 'Insufficient Balance');
        tokenBalances[_from] -= _value;
        tokenBalances[_to] +=_value;
        emit Transfer(_from , _to , _value);
    }
    function approve(address _spender, uint256 _value) public override returns (bool success){
        require(tokenBalances[msg.sender]>=_value,'Insufficient balance');
        allowed[msg.sender][_spender]= _value;
        emit Approval(msg.sender , _spender , _value);
        return true;
    }
    function allowance(address _owner, address _spender) public view override returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
    
}


