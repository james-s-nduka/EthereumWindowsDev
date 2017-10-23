pragma solidity ^0.4.15;

contract PayRoll {

    // A collection of wallet accounts provided by Truffle
    address[] employees = [0x5994afC49B265FFbb5D87406C4dB783523E0dbbb, 0xa9638F458257f0CDe04208340864512c790AdE77, 0xF4a1B2BAB96b41555cDB91DB21eAa8C322CbeAc3, 0x8F331CCfBebeB8cF3DC8CF027c5cA4eB20E1cCCa, 0x3F2f171c1b00FBBD485f403354b655259e331ACF];
    uint totalReceived = 0;
    mapping (address => uint) withdrawnAmounts;

    // The constructor with payable keyword so Ether can be sent to the contract.
    // When someoe creates or pays into the contact we want to update the totaReceived
    function PayRoll() payable {
        updateTotalReceived();
    }

    // The fallback function for anyone who just send 0 ether to the contract etc
    function() payable {
        updateTotalReceived();
    }

    // A function I don't want the outside world to see, so its internal
    function updateTotalReceived() internal {
        //The fund of accounts[0] who deployed the contract
        totalReceived += msg.value;
    }

    // This will check if an employees address is whitelisted
    modifier canWithdraw() {
        bool contains = false;

        for(uint i =0; i < employees.length; i++) {
            if(employees[i] == msg.sender) {
                contains = true;
            }
        }
        require(contains);
        _;
    }

    // Because we have included the modifier, this function can ONLY be executed upon canWithdraw being true
    function withdraw() canWithdraw {
        //How much can the employee calling the contract withdraw?
        uint amountAllocated = totalReceived/employees.length;

        //Check how much the employee has already withdrawn
        uint amountWithdrawn = withdrawnAmounts[msg.sender];

        // The amount we are giving the employee 
        uint amount = amountAllocated - amountWithdrawn;

        // Update the amount withdrawn
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount; 

        if(amount > 0) {
            msg.sender.transfer(amount);
        }
    }
}