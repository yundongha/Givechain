// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract TopDonors {
 
 struct Entry { address donor; uint256 amount; }
 Entry[] public board;
 mapping(address => uint256) public donations;
 uint256 public totalDonated;
 address public topDonor;
 uint256 public topAmount;
 
 function donate() external payable {
    require(msg.value > 0, "Donation must be > 0");
    board.push(Entry({donor: msg.sender, amount: msg.value}));
    donations[msg.sender] += msg.value;
    totalDonated += msg.value;
 // 더 크면 1위 교체
    if (donations[msg.sender] > topAmount) {
        topDonor = msg.sender;
        topAmount = donations[msg.sender];
    }
 }
 function count() external view returns (uint256) {
    return board.length;
 }
}
