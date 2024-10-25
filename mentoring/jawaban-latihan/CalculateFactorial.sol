// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FactorialContract {
    function calculateFactorial(uint256 n) public pure returns (uint256) {
        uint total = 1;
        for(uint i=1; i<=n ;i++){
            total *= i;
        }
        return total;
    }
}