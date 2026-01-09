// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title Minimal counter for scripting demos
/// @notice Provides set and increment helpers used by Counter.s.sol
contract Counter {
    uint256 public number;

    /// @notice Set the counter to a specific value
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    /// @notice Increase the counter by one
    function increment() public {
        number++;
    }
}
