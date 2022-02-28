pragma solidity ^0.4.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/WeiboRegistry.sol";

contract TestWeiboRegistry {
    string name = "darren"; //账户名称
    address addr = 0xE4F2CAa1dF0Bd8c960bE63970f4FD9f08387Cd5e; // 注册地址
    WeiboRegistry meta = WeiboRegistry(DeployedAddresses.WeiboRegistry());

    // 注册
    function testRegistry() {
        meta.register(name, addr);
    }

    // 获取数量
    function testGetNumberOfAccounts() {
        uint expected = 1; // 期望数量

        Assert.equal(meta.getNumberOfAccounts(), expected, "the number of accounts is expected");
    }

    // 获取指定的账号
    function testGetNameOfAccount() {
        Assert.equal(meta.getNameAccount(addr), "darren", "the name of accounts is expected");
    }
}
