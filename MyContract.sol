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