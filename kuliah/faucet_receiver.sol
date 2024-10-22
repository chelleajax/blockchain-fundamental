// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Faucet.sol";

contract FaucetReceiver{
    receive() external payable{}
    Faucet _faucet;

    constructor(address payable _faucetAddress){
        _faucet = Faucet(_faucetAddress);
    }
    function absorbToken() public {
        _faucet.withdraw(0.1 ether);
    }
}