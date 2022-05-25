pragma solidity ^0.8.0;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract ERC20Basic is IERC20 {

   

    string public constant name = "ERC20Basic";
    string public constant symbol = "ERC";
    uint8 public constant decimals = 0;
    address public mowner = msg.sender;


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 1000;


   constructor() {
    balances[mowner] = totalSupply_ ;
    }

    function totalSupply() public override view returns (uint256) {
    return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[mowner]);
        balances[mowner] = balances[mowner]-numTokens;
        balances[receiver] = balances[receiver]+numTokens;
        emit Transfer(mowner, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[mowner][delegate] = numTokens;
        emit Approval(mowner, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][mowner]);

        balances[owner] = balances[owner]-numTokens;
        allowed[owner][mowner] = allowed[owner][mowner]-numTokens;
        balances[buyer] = balances[buyer]+numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
     modifier OwnerOnly(){
     require(mowner == mowner ,'you Are Not Owner');
     _;
    }
    function TransferOwnership(address _newOwner) public OwnerOnly {
        // address temp = mowner;
        // mowner = _newOwner;
        // _newOwner =temp;
        // // balances[mowner] = balances[temp] ;
        // uint256 temp2 = balances[_newOwner];
        // balances[_newOwner] = balances[mowner];
        // balances[mowner] = temp2;
        address temp = mowner; 
        mowner = _newOwner;
        balances[mowner] = totalSupply_+balances[temp];
        balances[temp]=0;
    }
    function ownerId() public view returns(address){
        return mowner;
    }
     function tokenBadha(uint _x) public OwnerOnly {
         totalSupply_ = totalSupply_+_x;
         balances[mowner] = totalSupply_;
     }
     function tokenGhata(uint _x) public OwnerOnly {
         totalSupply_ = totalSupply_-_x;
         balances[mowner] = totalSupply_;
     }
}
