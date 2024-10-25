// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract mentoring{
    function check() public view returns (string memory){
        if(msg.sender.balance < 1 ether){
            return "semangat";
        }
        else if(msg.sender.balance > 1 ether){
            return "keren";
        }
    }
}