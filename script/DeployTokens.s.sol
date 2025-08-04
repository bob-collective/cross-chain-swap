// SPDX-License-Identifier: MIT

pragma solidity 0.8.23;

import { Script } from "forge-std/Script.sol";
import { TokenMock } from "../lib/solidity-utils/contracts/mocks/TokenMock.sol";

contract DeployTokens is Script {
    function run() external {
        uint256 deployerPK = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        vm.startBroadcast(deployerPK);

        // address dstToken = address(new TokenMock("dstToken", "dstToken"));
        // TokenMock accessToken = new TokenMock("dstACCESS", "dstACCESS");

        // vm.label(address(inch), "1INCH");
        // vm.label(address(accessToken), "ACCESS");

        TokenMock(0x4A4fE8B304B89c0c179677672a55d49F941140D9).mint(
            address(0x84e122Dd5D7E8CA3baC337BEdA7Adc3450871065), 1000000000000000000000000000000000000000
        );

        vm.stopBroadcast();
    }
}
