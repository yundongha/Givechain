// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract VoterLoop {
address[] public voters;
mapping(address =>uint256) public scoreOf;
uint256 public totalRegistered;
uint256 public constant FLOOR = 0.01 ether;
function register() external {
if (scoreOf[msg.sender] > 0) return;
voters.push(msg.sender);
totalRegistered ++;
}
function vote(uint256 amount) external payable {
if (amount == 0) amount = FLOOR;
scoreOf[msg.sender] += amount;
}
function countAbove(uint256 threshold)
external view returns (uint256 n)
{
for (uint256 i = 0; i < voters.length; i ++) {
if (scoreOf[voters[i]] > threshold) n ++;
}
}
}