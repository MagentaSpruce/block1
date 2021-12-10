

const FaucetContract = artifacts.require("Faucet");// Gives us bytecode 

module.exports = function (deployer) {
    deployer.deploy(FaucetContract) //deployer is an object containing deploy function which will migrate the contract to Ganache
}