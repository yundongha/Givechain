// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract CampaignBoard {
    struct Campaign {
        address owner;
        string title;
        uint256 goal;
}
mapping(uint256 => Campaign)
    private boards;
mapping(uint256 => uint256)
    public raised;
uint256[] public campaignIds;
function create(
    string calldata titleParam,
    uint256 goalAmount
) external {
    uint256 campaignId = campaignIds.length;
    boards[campaignId] =
        Campaign(msg.sender, titleParam, goalAmount);
    campaignIds.push(campaignId);
}
function donate(
    uint256 campaignId
) external payable {
    raised[campaignId] += msg.value;
}
}