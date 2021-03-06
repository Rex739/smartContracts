// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract ExToken {
    
    string public name = "Ex Token";
    string public symbol = "EXT";
    uint256 public totalSupply_ = 1000000000000;
    uint8 decimal = 18;
    
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 value
    );
    
    event Approve(
        address indexed _owner,
        address indexed spender,
        uint256 value
    );
    
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;
    
    constructor() public {
        balances[msg.sender] = totalSupply_;
    }
    
    function tatalSupply() public view returns(uint256) {
        return totalSupply_;
    }
    
    function balanceOf(address _owner) public view returns(uint256) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, 'insufficient funds');
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns(bool success) {
        allowed[msg.sender][_spender] =  _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public  returns(bool success) {
        require(balances[_from] >= _value, 'insufficient balances in ${_from}');
        require(allowed[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
