// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract RefundLoop {
mapping(address =>uint256) public owed;
uint256 public constant STEP = 0.1 ether;
function setDemo(address a, uint256 v) external {
owed[a] = v;
}
function drain(address payable to) external {
uint256 sent;
while (owed[to] >= STEP) {
owed[to] -= STEP;
(bool ok,) = to.call{value: STEP}("");
if (!ok) break;
sent += STEP;
}
}
}
