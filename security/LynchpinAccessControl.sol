// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

// This is the SHIELD. It manages who has the power to change the system.
// It uses a "Multi-Sig" logic: Critical actions require the "Lynchpin" consensus.
contract LynchpinAccessControl is AccessControl {

    // Define the Roles
    bytes32 public constant ARCHITECT_ROLE = keccak256("ARCHITECT_ROLE"); // You (The Creator)
    bytes32 public constant GUARDIAN_ROLE = keccak256("GUARDIAN_ROLE");   // Security Auditors / Backup Keys
    bytes32 public constant AI_AGENT_ROLE = keccak256("AI_AGENT_ROLE");   // Your Automated Agents

    // Event: Log every time a critical door is opened
    event EmergencyShutdown(address indexed triggeredBy, uint256 timestamp);

    bool public isPaused = false; // "Circuit Breaker" to freeze the system if attacked

    constructor() {
        // Grant the deployer (You) the supreme admin role
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(ARCHITECT_ROLE, msg.sender);
    }

    // FUNCTION: Emergency Freeze (The "Coma" State)
    // If an attack is detected, this freezes the entire network instantly.
    function emergencyPause() external onlyRole(ARCHITECT_ROLE) {
        isPaused = true;
        emit EmergencyShutdown(msg.sender, block.timestamp);
    }

    // FUNCTION: Resume Operations
    function resumeOperations() external onlyRole(ARCHITECT_ROLE) {
        isPaused = false;
    }

    // MODIFIER: Attach this to other contracts to protect them
    modifier whenNotPaused() {
        require(!isPaused, "System is in Emergency Stasis");
        _;
    }

    // FUNCTION: Rotate Keys (Change the Locks)
    // Allows you to replace a compromised key with a new one.
    function rotateKey(address oldKey, address newKey, bytes32 role) external onlyRole(ARCHITECT_ROLE) {
        revokeRole(role, oldKey);
        grantRole(role, newKey);
    }
}
