// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mentoring{
    // TIPE DATA:
    // int 
    // uint256 -> positive integer
    // bool -> true/false
    // string 
    // address -> identifier ke wallet

    // VISIBILITY
    // public -> bisa diakses oleh semua contract
    // private -> cmn kontrak ini yang bisa akses
    // internal -> bisa diakses kontrak ini dan sub-contractnya
    // external -> hanya bisa diakses kontrak external 

    // MUTABILITY
    // pure -> tidak merubah kontrak
    // view -> read only, tidak merubah 
    // payable -> bisa menerima ether

    // CHALLENGE -> buat angka faktorial
    // example -> input = 5
    // input -> n 1*2*3*4*5
    
    function calculateFactorial(uint256 n) public pure returns (uint) {
        uint total = 1;
        for(uint i=1; i<=n ;i++){
            total *= i;
        }
        return total;
    }


    // function bayar(address _receiver, uint256 _amount) public payable{
    //     require(msg.sender.balance < 0.1 ether, "duit tidak cukup");
        
        

    // }

}