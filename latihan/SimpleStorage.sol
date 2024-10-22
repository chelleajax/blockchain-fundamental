// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{

    // DATA TYPE
    // boolean -> true false
    // uint -> positive integer
    // int
    // address -> wallet addr
    // bytes -> 0x, maksimal 32 bytes
    
    // bool hasFavNumber = true;
    // string inText = "dua puluh dua";
    // address myAddress = 0x597C4d77e785A1A0e2B93a5d94eE4F9FBD6868D4;

    // FUNCTION VISIBILITY
    // public -> bisa diakses oleh semua orang yang interact 
    // private -> cmn contract ini yang bisa akses
    // external -> cmn bisa diakses externally
    // internal -> cmn bisa diakses contract dan anak2nya
    // kalo ga specify auto internal

    uint public favNum; // otomatis null value dalam tipe data tersebut = 0
    
    struct People{
        uint favNum;
        string name;
    }

    People[] public people;

    function store(uint  _favNum) public {
        favNum = _favNum;
    }

    // view -> cmn bisa liat
    // pure -> ga ngubah apa2 gabisa baca jg. cmn bisa kyk print    
    function retrieve() public view returns(uint){
        return favNum;
    }

    // PLACE TO STORE DATA (untuk array/str)
    // calldata, memory -> temporary, calldata gbs modified
    // storage -> permanent variable dan bisa di modified

    function addPerson(string memory _name, uint _favNum) public {
        // people.push(People(_favNum, _name));
        // People memory newPerson = People(_favNum, _name);
        people.push(People(_favNum, _name));
        nametofavNum[_name] = _favNum;
    }

    // biar pas input string langsung keluar favnum
    mapping (string => uint) public nametofavNum;

    
}