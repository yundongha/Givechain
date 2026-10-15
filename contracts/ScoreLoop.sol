// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ScoreLoop {
uint256[] public scores;
function record(uint256 s) external {
scores.push(s);
}
function countAbove(uint256 threshold)
external view returns (uint256 n)
{
for (uint256 i = 0; i < scores.length; i ++) {
if (scores[i] > threshold) n ++;
}
}
function total() external view returns (uint256 t) {
for (uint256 i = 0; i < scores.length; i ++) {
t += scores[i];
}
}
}