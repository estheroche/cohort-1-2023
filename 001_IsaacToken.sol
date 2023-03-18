//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//A simple ERC20 token
contract IsaacToken {
    //public variables for the name, symbol and number of decimals of the token
    string public name;
    string public symbol;
    uint8 public decimals = 0;

    //total supply of the token and the owner of the contract
    uint256 public totalSupply;
    address owner;

    //constructor function, called when the contract is deployed
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
        //calls the _mint function to mint initial supply
        _mint(100000);
    }

    //mapping to keep track of balances of each address
    mapping(address => uint) balance;
    //mapping to keep track of the allowances for each address to spend tokens on behalf of others
    mapping(address => mapping(address => uint256)) _allowances;

    //events to be emitted when transfer or approve is called
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    //returns the balance of a specific address
    function balanceOf(address _owner) public view returns (uint256) {
        return balance[_owner];
    }

    //transfer tokens from one address to another
    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        //checks if the sender has sufficient balance
        require(balance[msg.sender] >= _value, "You dont have enough balance");
        ///debits the sender's balance
        balance[msg.sender] -= _value;
        //credits the receiver's balance
        balance[_to] += _value;
        //emit a transfer event
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    //transfer tokens from one address to another on behalf of someone else
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        //checks if the spender is allowed to spend tokens on behalf of the sender
        uint256 allowedToSpend = allowance(_from, msg.sender);
        require(_value <= allowedToSpend, "You cant spend above your limit");
        ///debits the sender's balance
        balance[_from] -= _value;
        //debits the allowance of the spender
        _allowances[_from][msg.sender] -= _value;
        //credits the receiver's balance
        balance[_to] += _value;
        //emit a transfer event
        emit Transfer(_from, _to, _value);
        return true;
    }

    //returns the amount spender is allowed to spend on behalf of owner
    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }

    //sets the amount spender is allowed to spend on behalf of owner
    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        //checks if the sender has sufficient balance
        require(balance[msg.sender] >= _value, "You dont have enough balance");
        //sets the allowance of the spender
        _allowances[msg.sender][_spender] = _value;
        //emit an Approval event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // This function mints new tokens and adds to the owner's balance
    // Only the owner can call this function
    function _mint(uint256 _amount) private {
        require(msg.sender == owner);
        require(msg.sender != address(0));
        totalSupply += _amount;
        balance[msg.sender] += _amount;

        emit Transfer(address(this), msg.sender, _amount);
    }

    // This function burns a certain amount of tokens by transferring them to address(0)
    function burn(uint256 _amount) public {
        require(balance[msg.sender] >= _amount);
        transfer(address(0), _amount);
        totalSupply -= _amount;

        emit Transfer(msg.sender, address(0), _amount);
    }
}
