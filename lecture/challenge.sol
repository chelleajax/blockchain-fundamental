// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Judge{
    function check() public view returns (string memory){
        if( msg.sender.balance > 1 ether){
            return "Hari yang baik ya";
        }
        else if( msg.sender.balance < 1 ether){
            return "Dunia ini sulit ya";
        }
        else {
            return "";
        }
}