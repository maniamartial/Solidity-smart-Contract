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
         peopleCount+=1;
     //people.push(Person(_firstName, _lastName));
people[peopleCount]=Person(peopleCount, _firstName, _lastName);
}
}
*/