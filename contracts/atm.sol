// // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ATM {
    uint256 pin;
    uint256 balance;
    bool permission;
    error loginFailed();

    constructor(uint256 _pin) {
        pin = _pin;
        balance = 5000;
    }

    function Login(uint256 _upin) public returns (string memory success) {
        if (pin == _upin) {
            permission = true;
            return "Successful Login";
        } else {
            revert loginFailed();
        }
    }

    function Withdraw(uint256 amount) public {
        if (permission) {
            
            //  2 condition in one Require Condition
            //   require((balance > amount) && (amount>500),"Amount InCorrect  && insufficient balance");

            require(balance > amount, "Insufficient Balance");
            require(amount > 500, "Minimum Withdraw is 501");

            //  if you want to withdraw multiple of 500 like Atm
            //  require(amount%500==0,"You can Withdraw multiple of 500");

            balance -= amount;
        } else {
            revert loginFailed();
        }
    }


      function Deposit(uint256 amount) public {
        if (permission) {
            require(amount >= 2000, "Minimum Deposit 2000");
            balance += amount;
        } else {
            revert loginFailed();
        }
    }



        function CheckBalance() public view returns (uint) {
        if (permission) {
            return balance;
        } else {
            revert loginFailed();
        }
    }

    
     

}



// checking github is working or not