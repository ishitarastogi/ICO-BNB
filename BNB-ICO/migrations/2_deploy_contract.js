const BUSD = artifacts.require("BUSD");

module.exports = function (deployer) {
  deployer.deploy(BUSD , 5120000);
};
