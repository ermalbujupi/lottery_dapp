// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

/**
 * @title A sample Raffle Contract
 * @author Ermal Bujupaj
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2
 */
contract Raffle {
    error Raffle_NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    //* Events */
    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable {
        if (msg.value >= i_entranceFee) {
            revert Raffle_NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    // 1. Get a random number
    // 2. Use the random number to pick a player
    // 3. Be automatically called
    function pickWinner() public {}

    /** Getter Functions */

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
