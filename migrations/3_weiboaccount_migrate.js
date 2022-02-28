const WeiboAccount = artifacts.require("WeiboAccount");

module.exports = function (deployer) {
  deployer.deploy(WeiboAccount);
};
