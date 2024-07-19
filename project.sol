// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.26;

contract houseContract { 
    address public owner; 
    bool public isPresent;

    constructor() {
        owner = msg.sender;
        isPresent = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the land owner can access.");
        _;
    }

    function enterHouse() public onlyOwner {
        isPresent = true;
    }

    function leaveHouse() public onlyOwner  {
        isPresent = false;
    }

    function checkPresence() public view {
        if(isPresent == false) {
            revert("Land owner is not in MetaHouse.");
        } 
        else {
            revert("Land owner is in MetaHouse.");
        }
    }

    function verifyOwnership() public view {
        assert(msg.sender == owner);
    }
}
