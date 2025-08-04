// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { IEscrow } from "./IEscrow.sol";

/**
 * @title Destination Escrow interface for cross-chain atomic swap.
 * @notice Interface implies withdrawing funds initially and then unlocking them with verification of the secret presented.
 * @custom:security-contact security@1inch.io
 */
interface IEscrowDst is IEscrow {
    error CallReverted(uint256 index, Call[] calls);
    error InvalidCall(uint256 index, Call[] calls);

    struct Call {
        address target;
        bytes callData;
        uint256 value;
    }
    /**
     * @notice Withdraws funds to maker
     * @dev Withdrawal can only be made during the withdrawal period and with secret with hash matches the hashlock.
     * @param secret The secret that unlocks the escrow.
     * @param immutables The immutables of the escrow contract.
     */

    function publicWithdraw(bytes32 secret, IEscrow.Immutables calldata immutables) external;

    function withdrawWithInteraction(bytes32 secret, IEscrow.Immutables calldata immutables, bytes memory interaction) external;
}
