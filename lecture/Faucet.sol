
// pragma solidity ^0.8.0;

// contract Faucet{
//     //payable bisa nerima eth, receive buat nyimpen eth
//     // dipanggil user yg minta
//     receive() external payable { }

//     // EOA -> external own account???
//     function sedekah (uint sedekahAmount) external {
//         // sedekahAmount *= 1 ether;
//         // eth gabisa terima float, makanya ada wei
//         // require untuk syarat baru bisa dijalankan
//         // cek balance kita
//         require(address(this).balance >= sedekahAmount, "ga ada duit :(");
//         // default value adalah wei
//         require(sedekahAmount <= 1 ether, "jangan maruk");
//         require(msg.sender.balance < 90 ether, "minggir lu kaya");

//         // panggil wallet EOA, {brp ether}, (message)
//         // call bakal masuk ke blockchain untuk save transaksi
//         (bool success, ) = msg.sender.call{value: sedekahAmount}("message");

//         // if pake kalo mau return data aja
//         require(success, "ada error ni");
//     }
// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Faucet {
    receive() external payable {}

    function withdraw(uint256 withdrawAmount) public {
        require(withdrawAmount <= 0.1 ether, "Withdraw amount exceeds the limit");

        require(address(this).balance >= withdrawAmount, "Faucet empty, try again later");
        

        (bool success, ) = msg.sender.call{value: withdrawAmount}("");
        require(success, "Transfer failed.");
    }
    
    // return faucet kita isinya ada brp duit
    function getFaucetBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
