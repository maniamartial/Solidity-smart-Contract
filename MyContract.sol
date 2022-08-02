// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract MyContract{
    string value;

    constructor() public{
        value="myValue";
    }

    function get() public view returns(string memory){
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}

//Can work the smae as
// SPDX-License-Identifier: UNLICENSED



contract MyContract{
    string public value="myValue" ;

   

    function set(string memory _value) public {
        value = _value;
    }
}

//How to use ENUM

contract MyContract{
    enum State { Waiting, Ready, Active}
    State public state;

    constructor() {
        state=State.Waiting;
    }

    function activate() public{
        state=State.Active;
    }
    function isActive() public view returns(bool){
        return state== State.Active;
    }
}

//simple arecord name sof people



contract MyContract{
  Person []public people;
 uint256 public peopleCount;
  struct Person{
      string _firstName;
      string _lastName;
  }

  function addPerson(string memory _firstName, string memory _lastName) public{
     people.push(Person(_firstName, _lastName));
     peopleCount+=1;
}
}


//Alternative code of adding and counting peopel using mapping

/*

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract MyContract{
    uint256 public peopleCount=0;
//  Person []public people;
 mapping(uint=>Person) public people;
  struct Person{
      uint id;
      string _firstName;
      string _lastName;
  }

  function addPerson(string memory _firstName, string memory _lastName) public{
         incrementCount();
     //people.push(Person(_firstName, _lastName));
people[peopleCount]=Person(peopleCount, _firstName, _lastName);
}

function incrementCount() internal {
    peopleCount+=1;
}
}

*/

// SPDX-License-Identifier: UNLICENSED
//Using modifiers
example 1

pragma solidity ^0.8.7;

contract MyContract{
    uint256 public peopleCount=0;
    address owner;
uint256 openinTime=1659371761;
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }

//  Person []public people;
 mapping(uint=>Person) public people;
  struct Person{
      uint id;
      string _firstName;
      string _lastName;
  }

  constructor(){
      owner=msg.sender;
  }

  function addPerson(
      string memory _firstName, 
  string memory _lastName) 
  

  public  onlyOwner{
         incrementCount();
     //people.push(Person(_firstName, _lastName));
people[peopleCount]=Person(
    peopleCount, 
    _firstName, 
    _lastName);
}

function incrementCount() internal {
    peopleCount+=1;
}
}
/*
Example 2, restrictiong using timer

// SPDX-License-Identifier: UNLICENSED
//Using modifiers

pragma solidity ^0.8.7;

contract MyContract{
    uint256 public peopleCount=0;
    
uint256 openinTime=1659372100;

    modifier onlyOpenAt(){
        require(block.timestamp >= openinTime);
        _;
    }

//  Person []public people;
 mapping(uint=>Person) public people;
  struct Person{
      uint id;
      string _firstName;
      string _lastName;
  }




  function addPerson(
      string memory _firstName, 
  string memory _lastName) 
  

  public  onlyOpenAt{
         incrementCount();
     //people.push(Person(_firstName, _lastName));
people[peopleCount]=Person(
    peopleCount, 
    _firstName, 
    _lastName);
}

function incrementCount() internal {
    peopleCount+=1;
}
}
*///Transfer of token from one account to another
// SPDX-License-Identifier: UNLICENSED


contract myContract{
mapping(address=>uint256) public balances;
address payable wallet;
event Purchase(
    address indexed _buyer,
    uint256 _amount
);

constructor(address payable _wallet) public{
wallet=_wallet;
}
function() external payable{
    buyToken();
}


    function buyToken() public payable{
        //buy token
balances[msg.sender]+=1;
        //send ether to wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender,1);
    }
}

//// SPDX-License-Identifier: UNLICENSED
//using multiple smart contracts..parent child relationships

pragma solidity ^0.5.1;
contract ERC20Token{
    string public name;
    mapping(address=>uint256) public balances;

    function mint() public{
        balances[tx.origin]++;
    }
}
contract myContract{
mapping(address=>uint256) public balances;
address payable wallet;
address public token;


constructor(address payable _wallet, address _token) public{
wallet=_wallet;
token=_token;
}

function() external payable{
    buyToken();
}


    function buyToken() public payable{
     //ERC20Token _token=ERC20Token(address(token));
       // _token.mint();...lets use a nice shorthamd of writing imilar code
       ERC20Token(address(token)).mint();
        //buy token

        //send ether to wallet
        wallet.transfer(msg.value);

    }
}

// SPDX-License-Identifier: UNLICENSED
//Inheritance
pragma solidity ^0.5.1;
contract ERC20Token{
    string public name;
    mapping(address=>uint256) public balances;

constructor(string memory _name) public{
    name=_name;
}
    function mint() public{
        balances[tx.origin]++;
    }
}
contract myToken is ERC20Token{
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

constructor(string memory _name,
 string memory _symbol) ERC20Token(_name)
  public{
    symbol=_symbol;

}

function mint() public{
    super.mint();
    ownerCount++;
    owners.push(msg.sender);
}
}

//
// SPDX-License-Identifier: UNLICENSED
//IUsing math and libraries....in solidity
pragma solidity ^0.5.1;

library Math{
    function divide(uint256 a, uint256 b) internal pure returns (uint256){
        require(b>0);
        uint256 c=a/b;
        return c;
    }
}

contract myContract{
    uint256 public value;

    function calculate(uint _value1, uint _value2) public{
    value=Math.divide(_value1, _value2);
    }
}

//Exmple 2 on libraries..importing external libraries
// SPDX-License-Identifier: UNLICENSED
//IUsing math and libraries....in solidity
pragma solidity ^0.8.0;
import "./safeMath.sol";

contract myContract{
    using SafeMath for uint256;
    uint256 public value;

    function calculate(uint _value1, uint _value2) public{
    value=_value1.div(_value2);
    }
}