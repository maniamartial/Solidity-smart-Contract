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
*/