pragma solidity ^0.4.0;

contract WeiboAccount{

   // 微博结构

    struct _weibo{
        // 微博发送时间
        uint timestamp;
        //微博发送内容
        string content;
    }

    // 所发送的微博数量
    uint _numberOfWeibos;
    //微博账户的所有者
    address _adminAddress;
    // 通过账号id查找微博
    mapping(uint=>_weibo) _mapWeibos;

    // 构造函数
    function WeiboAccount(){
        _numberOfWeibos=0;
        _adminAddress =msg.sender;

    }


    // 权限控制
    modifier onlyAdminAccount(){
        require(_adminAddress == msg.sender);
        _;
    }

    // 发送微博
    function sendWeibo(string _content) onlyAdminAccount{
     require(bytes(_content).length<=160 && bytes(_content).length!=0);
     _mapWeibos[_numberOfWeibos].timestamp=now;
     _mapWeibos[_numberOfWeibos].content=_content;
     _numberOfWeibos++;
    }


    // 通过id查找微博
    function getContentOfId(uint id) constant returns(uint timestamp,string content){
        timestamp=_mapWeibos[id].timestamp;
        content=_mapWeibos[id].content;
    }



    // 查看最新一条微博
     function getLastestWeibo() constant returns(uint timestamp,string content){
        timestamp=_mapWeibos[_numberOfWeibos-1].timestamp;
        content=_mapWeibos[_numberOfWeibos-1].content;
    }

    // 返回微博的总数
    function getNumberOfWeibos() constant returns(uint numberOfweibos){
        numberOfweibos=_numberOfWeibos;
    }

    
    // 返回微博账户的所有者
    function getAdminOfWeibos() constant returns(address){
      return _adminAddress;
    }

    /*
     考虑打赏
     记录打赏的事件
     回退函数(接受打赏)

    */

    // 摧毁合约
    function adminDeleteAccount(){
        selfdestruct(_adminAddress);
    }

    // 获取当前账户
    function getAddress() constant returns(address){
        return msg.sender;
    }

}