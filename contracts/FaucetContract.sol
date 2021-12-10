//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.9.0;

import "./Owned.sol";

contract Faucet is Owned {
    uint public numOfFunders;
    
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    modifier limitWithdrawl(uint withdrawlAmount){
        require(withdrawlAmount <= 100000000000000000, "Withdrawl limit is 1 ETH. Please withdrawl a lower amount.");
        _;
    }

    receive() external payable {}

    function addFunds() payable external {
        address funder = msg.sender;
        if(!funders[funder]){
            uint index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdrawl(uint withdrawlAmount) external limitWithdrawl(withdrawlAmount) {
            payable(msg.sender).transfer(withdrawlAmount);   
    }

    function test1() external onlyOwner {
        // mint and things that are restricted to admin - accounts[0]
    }

    function test2() external onlyOwner {
        //restricted to admin - accounts[0]
    }

    function getFunderAtIndex(uint8 index) external view returns(address){
        return lutFunders[index];
    }

    function getAllFunders() external view returns (address[] memory){
        address[] memory _funders = new address[](numOfFunders);
        for (uint i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }
            return _funders;
    }
}

