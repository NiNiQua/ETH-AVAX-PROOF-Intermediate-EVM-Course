// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ATM {
    address private owner;
    uint private balance;

    constructor() {
        owner = msg.sender;
        balance = 100000; // Initial balance 
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        require(amount <= balance, "Insufficient balance.");

        balance -= amount;
    }

    function deposit(uint amount) public {
        assert(amount > 0); // Ensure deposit amount is positive
        balance += amount;
    }

    function checkBalance() public view returns (uint) {
        if (msg.sender!= owner) {
            revert("Only the owner can check the balance.");
        }
        return balance;
    }
}
