pragma solidity ^0.4.15;

contract SynCoin {
    // create the owner state variable
    address public owner;
    // a hashtable of address and integer balances
    mapping (address => uint) balances;

    function SynCoin() {
        // The value of the address that is sending a transaction
        // msg.sender is the address of who is calling on the contract
        owner = msg.sender;
        balances[owner] = 1000;
    }

    // Transfer funds from the user calling the contract to address they've given
    // The condition ensures the user calling the function has sufficient funds
    function transfer(address _to, uint _value) constant returns (bool _result) {
        if (balances[msg.sender] < _value) {
            return false;
        }
    //usage: syncoin.transfer.sendTransaction(account2, 300)
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    // Constant means that this function does not change the state of the blockchain
    function getBalance(address _user) constant returns (uint _balance) {
        return balances[_user];
    }
}
