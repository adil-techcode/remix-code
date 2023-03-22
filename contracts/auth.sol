// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ATM {
    uint u_pincode = 520;
    uint  balance = 5466;
    uint pincode;

    constructor(uint code) {
        pincode = code;
    }

    function auth() internal view returns (bool) {
        if (u_pincode == pincode) {
            return true;
        } else {
            return false;
        }
    }

    function withdraw(uint amount) public{
         if (auth()) {
              balance -= amount;  
        } 
    }

        function deposit(uint amount) public{
         if (auth()) {
              balance += amount;  
        } 
       
    }

    
     function checkBalance() public view returns(uint){ 
    if(auth()){
     return balance;
     }

     }


}
