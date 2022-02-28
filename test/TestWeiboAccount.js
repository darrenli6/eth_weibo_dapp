var WeiboAccount = artifacts.require("WeiboAccount");

contract('WeiboAccount', function (accounts) {
    it('send weibo ', function () {
        var weiboInstance;
        return WeiboAccount.deployed().then(function (instance) {
            weiboInstance = instance;
            weiboInstance.sendWeibo("this is my first weibo");
        });
    });

    it('get number of weibos ', function () {
        return WeiboAccount.deployed().then(function (instance) {
            return instance.getNumberOfWeibos.call();
        }).then(result => {
            console.info(result.toString());
        })
    });
});
