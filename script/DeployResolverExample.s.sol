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

        IEscrowFactory factory = IEscrowFactory(address(0xE7df2ea8D58EeD8F72E24c54C3d1187eFc6278fa));
        IOrderMixin lop = IOrderMixin(address(0x073622341e21CBEf798DE6af07A6C94d305c6002));
        address initialOwner = deployer;

        new ResolverExample(factory, lop, initialOwner);

        vm.stopBroadcast();
    }
}
