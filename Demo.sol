// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


contract MyShop {
    address public owner;  /* Take an address */
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;  // Save in blockchain
    }

    function payForItem() public payable {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable to = payable(owner);
        address _thisContract = address(this); 
        to.transfer(_thisContract.balance);
    }
}