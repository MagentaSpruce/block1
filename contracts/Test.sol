//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 < 0.9.0;

contract Test {

    function test(uint testNum) external pure returns (uint data){

            assembly {
                mstore(0x40,0xd2)
            }

        uint8[3] memory items = [1, 2, 3];

        assembly {
            data := mload(0x90)
        }

        return testNum;
    }

    function test2() external pure returns (bytes32 data) {
        assembly {
            let fmp := mload(0x40)
            mstore(add(fmp, 0x00), 0x73756E6E79)
            data := mload(add(fmp, 0x00))
        }
    }
}