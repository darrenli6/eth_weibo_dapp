pragma solidity ^0.4.0;

contract WeiboRegistry{
  // 管理员的账号
  address _adminAccount;// 管理员账号
  uint _numberOfAccounts ; // 平台上的账号数量

  mapping(uint => address) _idToAccount; // id 地址

  mapping(address => string) _accountToName; // 账号与昵称的关联


  mapping(string => address) _nameToAccount; // 账号与昵称的关联

 

  // 修饰符 平台管理员的权限
  modifier onlyAdmin{
      require(msg.sender == _adminAccount);
      _;
  }

  function WeiboRegistry(){
     _numberOfAccounts =0 ; // 平台初始微博账号

     _adminAccount=msg.sender;  //管理员赋值

  } 

  // 注册账户
  function register(string name,address addr){
      require(bytes(_accountToName[addr]).length ==0); // 账户没有被注册过
      //限制昵称的长度
      require(bytes(name).length <=64 && bytes(name).length !=0);

      // 地址必须存在
      require(addr !=0);

      _idToAccount[_numberOfAccounts]=addr;
        
      _accountToName[addr]=name;

      _nameToAccount[name]=addr;

      _numberOfAccounts++;// 账号总数+1

  }



  // 获取账户数量
  function getNumberOfAccounts() constant returns(uint){
      return _numberOfAccounts;
  }

  // 通过id查找地址
  function getAccOfId(uint id) constant returns(address account){
      account =_idToAccount[id];
  }


  // 通过昵称查找地址
  function getAccOfName(string name) constant returns(address account){
      account = _nameToAccount[name];
  }

  // 通过地址查找昵称
  function getNameAccount(address addr) constant returns(string name){
      name= _accountToName[addr];
  }

  // 摧毁合约的函数
  function adminDeleteContract() onlyAdmin{
      selfdestruct(_adminAccount);
  }





}