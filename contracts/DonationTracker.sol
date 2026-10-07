// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationTracker {
    struct Donation {
    address donor;
    uint256 amount;
    uint64 timestamp;   
    }   
uint256 public totalDonated;
mapping(address => uint256) public donations;
Donation[] public history;
function donate() external payable {
    totalDonated += msg.value;
    donations[msg.sender] += msg.value;
    history.push(Donation({
        donor: msg.sender,
        amount: msg.value,
        timestamp: uint64(block.timestamp)
    }));
    }
}