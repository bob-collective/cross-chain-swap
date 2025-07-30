// SPDX-License-Identifier: MIT

pragma solidity 0.8.23;

import { Script } from "forge-std/Script.sol";
import { ResolverExample } from "../contracts/mocks/ResolverExample.sol";
import { IEscrowFactory } from "../contracts/interfaces/IEscrowFactory.sol";
import { IOrderMixin } from "../lib/limit-order-protocol/contracts/interfaces/IOrderMixin.sol";

contract DeployResolverExample is Script {
    function run() external {
        uint256 deployerPK = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        vm.startBroadcast(deployerPK);

        IEscrowFactory factory = IEscrowFactory(address(0xBA8580929c23104139c2fb341C1a6Ff194a04eb1));
        IOrderMixin lop = IOrderMixin(address(0xAa9D5EED4df7a82f7De958e416d8487FD0EaE09b));
        address initialOwner = deployer;

        new ResolverExample(factory, lop, initialOwner);

        vm.stopBroadcast();
    }
}
