pragma solidity ^0.4.15;

contract HelloWorld {
    uint public balance;
    
    // The constructor that initializes the balance upon the contract call
    function HelloWorld() {
        balance = 1000;
    }

    // The deposit function
    function deposit(uint _funds) returns(uint _newValue) {
        balance += _funds;
        return balance;
    }
}
