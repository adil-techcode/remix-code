// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ATM{

    uint pass;
    uint amount;
    bool password=false;

    string inc = "incorret amount entered";
    constructor(uint pin, uint balance)public {
        amount=balance;
        pass=pin;
    }

    function pass_checker(uint passw)public{
        require(passw==pass,"wrong password");
            password=true;
        }

    function add_money(uint balance) public {
        require(password==true,"amount +=balance;");
        amount +=balance;
    }

    function withdraw(uint balance) public {
        require(password==true,"amount +=balance;");
        require(balance>=amount,"insufficient balance");
        amount -=balance;               
    }

    function get_balance() public view returns(uint) {
        require(password==true,"amount +=balance;");
        {return amount;        
    }
}
}
