// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract SimpleOperations {

    function calculateAverage(
        uint256 a,
        uint256 b
    ) public pure returns (uint256) {
        uint total = (a+b)/2;
        return total;
    }

    function getBit(uint num, uint position) public pure returns (uint8) {
        require(position!=0, "jangan nol");
        uint[] memory binary = new uint[](256);
        uint i = 0;
        while(num>0){
            binary[i] = num % 2;
            num = num / 2;
            i = i + 1;
        }
        require(position<i+1, "goblok");
        return uint8(binary[position-1]);
    }

    function sendEth(address to) public payable {
        require(msg.value > 0, "Must send some ETH");
        require(msg.sender != to, "tlol");

        (bool success, ) = to.call{value: msg.value}("");
        require(success, "Transaction Fail");
    }
}