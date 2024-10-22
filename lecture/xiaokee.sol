// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// is kayak inherit di java
contract XiaokeeToken is ERC20{
    uint private constant INITIAL_SUPPLY = 1000000 * (10**18);
    address public taxCollector;
    uint public taxRate = 3;

    constructor (address _taxCollector) ERC20("XiaokeeToken", "XKEE"){
        // mint = mencetak uang
        _mint(msg.sender, INITIAL_SUPPLY);
    	taxCollector = _taxCollector;
    }

    function setTaxRate(uint _taxRate) public {
        taxRate = _taxRate;
    }

    function paySalary (address employeeAddress, uint salaryAmount) public{
        uint taxAmount = (salaryAmount * taxRate) / 100;
        uint netSalary =  salaryAmount - taxAmount;
        
        _transfer(msg.sender, employeeAddress, netSalary);
        _transfer(msg.sender, taxCollector, taxAmount);
    }
}