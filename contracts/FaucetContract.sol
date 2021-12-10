//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.9.0;

contract Faucet {
    uint public numOfFunders;

    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    receive() external payable {}

    function addFunds() payable external {
        address funder = msg.sender;
        if(!funders[funder]){
            uint index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdrawl(uint withdrawlAmount) external {
        require(withdrawlAmount <= 100000000000000000, "Withdrawl amount is over the set limit, please withdrawl a lower amount.");
            payable(msg.sender).transfer(withdrawlAmount);

        
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
