// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


//questions
/*It uses a constructor to assign the owner(the person who is currently connecting with the contract) address to the owner variable.
It uses the function modifier and set a restriction that only the owner can change the address. 
Set function. It uses for change owner. It takes input from the original owner and set the new owner equal to the address that input (only unsigned integers).*/


contract BEP_20REX {
    
    address public owner;

    //assign owner variable to the connected address
    constructor() {
        owner = msg.sender;
    }
    
    //set address modification to only the owner
    modifier ownerOnly {
        require(
            msg.sender == owner, "this function can only be called by the owner"
        );
    _;}
    
    //well i dont know how possible is it to convert address to uint
    // at the moment, this is all i know 
    
    function setNewOwner(address _newOwner) private ownerOnly{
        owner = _newOwner;
    }
    
}
