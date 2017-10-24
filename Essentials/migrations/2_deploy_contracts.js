var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var HelloWorld = artifacts.require("./HelloWorld.sol");
var SynCoin = artifacts.require("./SynCoin.sol");
var People = artifacts.require("./People.sol");
var Payroll = artifacts.require("./PayRoll")

module.exports = function(deployer) {
  //deployer.deploy(ConvertLib);
  //deployer.link(ConvertLib, MetaCoin);
  //deployer.deploy(MetaCoin);
  //deployer.deploy(HelloWorld);
  //deployer.deploy(SynCoin);
  //deployer.deploy(People);
  deployer.deploy(Payroll);
};
