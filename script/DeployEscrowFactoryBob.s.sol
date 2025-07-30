// SPDX-License-Identifier: MIT

pragma solidity 0.8.23;

import { Script } from "forge-std/Script.sol";
import { EscrowFactory } from "contracts/EscrowFactory.sol";
import { TokenMock } from "solidity-utils/contracts/mocks/TokenMock.sol";

import { LimitOrderProtocol } from "limit-order-protocol/contracts/LimitOrderProtocol.sol";
import "@1inch/solidity-utils/contracts/interfaces/IWETH.sol";

contract DeployEscrowFactoryBob is Script {
    uint32 public constant RESCUE_DELAY = 691200; // 8 days
    address public constant LOP = 0xAa9D5EED4df7a82f7De958e416d8487FD0EaE09b;
    address public constant ACCESS_TOKEN = 0xECE5F6b61A3d3D69e142DAd93975630210e77Df4; 
    address public constant FEE_TOKEN = 0x4A4fE8B304B89c0c179677672a55d49F941140D9; 

    function run() external {
        uint256 deployerPK = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        address feeBankOwner = deployer;
        vm.startBroadcast(deployerPK);

        // LimitOrderProtocol limitOrderProtocol = new LimitOrderProtocol(IWETH(0x4200000000000000000000000000000000000006));

        new EscrowFactory(LOP, TokenMock(FEE_TOKEN), TokenMock(ACCESS_TOKEN), feeBankOwner, RESCUE_DELAY, RESCUE_DELAY);

        vm.stopBroadcast();
    }
}
