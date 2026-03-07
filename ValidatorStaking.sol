// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ValidatorStaking {

    mapping(address => uint256) public stakes;

    event Staked(address validator, uint256 amount);
    event Withdrawn(address validator, uint256 amount);

    function stake() external payable {
        require(msg.value > 0, "Invalid stake amount");

        stakes[msg.sender] += msg.value;

        emit Staked(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(stakes[msg.sender] >= amount, "Insufficient stake");

        stakes[msg.sender] -= amount;

        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }
}