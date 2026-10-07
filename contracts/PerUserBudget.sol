// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract PerUserBudget {
struct Allowance {
uint256 cap;
uint256 spent;
}
mapping(address => Allowance)
public limits;
function setCap(uint256 capValue)
external
{
limits[msg.sender].cap = capValue;
}
function spend(uint256 amount)
external
{
Allowance storage userAllowance =
limits[msg.sender];
require(userAllowance.spent + amount <= userAllowance.cap);
userAllowance.spent += amount;
}
function remaining(
address account
) external view
returns (uint256)
{
return limits[account].cap -
limits[account].spent;
}
}