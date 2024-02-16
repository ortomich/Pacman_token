// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Pacman {

    uint256 public constant ONE_DAY = 86400;
    uint256 public immutable startTimeOfDeployDate = block.timestamp / ONE_DAY * ONE_DAY;

    // user => day => can toggle?
    mapping (address => mapping (uint256 => bool)) public userDayToggle;

    event Toggle(address indexed user, uint256 indexed day);

    function toggle() external {
        uint256 day = currentDay();
        require(!userDayToggle[msg.sender][day], "Already toggled today");
        userDayToggle[msg.sender][day] = true;
        emit Toggle(msg.sender, day);
    }

    function currentDay() public view returns (uint256) {
        return (block.timestamp - startTimeOfDeployDate) / ONE_DAY;
    }

}