// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract DonationGate {
uint256 public constant MIN = 0.01 ether;
uint256 public constant SOFT_CAP = 1 ether;

mapping(address =>uint256) public received;
uint256 public donorCount;
uint256 public smallTotal;
uint256 public hugeTotal;

function donate() external payable {
if (msg.value < MIN) return;
if (received[msg.sender] == 0) donorCount ++;
received[msg.sender] += msg.value;
if (msg.value <= SOFT_CAP) smallTotal += msg.value;
else hugeTotal += msg.value;
}
}
