//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {
    mapping(uint => uint) public aa; //slot 0
    mapping(address => uint) public bb; //slot 1

    uint[] public cc;

    uint8 public a = 7; //1 byte
    uint16 public b = 10; //2 bytes
    address public c = 0xa79eA1FbaA5dcD537d70E198d9Efdda2A6cbb8E0; //20 bytes
    bool d = true; //1 byte
    uint64 public e = 15; //8 bytes slot 2

    uint256 public f = 200; //32 bytes slot 3
    uint8 public g = 40; //1 byte slot 4
    uint256 public h = 789; //32 bytes slot 5

    constructor() {
        cc.push(1);
        cc.push(10);
        cc.push(100);

        aa[2] = 4;
        aa[3] = 10;
        bb[0xa79eA1FbaA5dcD537d70E198d9Efdda2A6cbb8E0] = 100;
    }
}

// 0000000000000000000000000000000000000000000000000000000000000002


// 000000000000000000000000a79eA1FbaA5dcD537d70E198d9Efdda2A6cbb8E0000000000000000000000000000000000000000000000000000000000000001