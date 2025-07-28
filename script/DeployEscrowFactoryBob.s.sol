// SPDX-License-Identifier: MIT

pragma solidity 0.8.23;

import { Script } from "forge-std/Script.sol";
import { EscrowFactory } from "contracts/EscrowFactory.sol";
import { TokenMock } from "solidity-utils/contracts/mocks/TokenMock.sol";

contract DeployEscrowFactoryBob is Script {
    uint32 public constant RESCUE_DELAY = 691200; // 8 days
    address public constant LOP = 0x073622341e21CBEf798DE6af07A6C94d305c6002; // Bob Sepolia
    address public constant ACCESS_TOKEN = 0xbcB21d7114693A435b466197EB6d5da2909b759e; // Bob Sepolia
    address public constant FEE_TOKEN = 0xAB0127f49f8c86E007407308405ed03bD1475f6E; // Bob Sepolia

    function run() external {
        uint256 deployerPK = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        address feeBankOwner = deployer;
        vm.startBroadcast(deployerPK);

        new EscrowFactory(LOP, TokenMock(FEE_TOKEN), TokenMock(ACCESS_TOKEN), feeBankOwner, RESCUE_DELAY, RESCUE_DELAY);

        vm.stopBroadcast();
    }
}
