// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Stack {
    uint public count = 0;
    mapping( uint => string) public store;

    modifier empty {
        require( count > 0 );
        _;
    }

    function push(string memory _value) public {
        count++;
        store[count] = _value;
    }

    function pop() public empty{
        count--;
        delete store[count + 1]; //mutating state
        peek();
    }

    function peek() public view returns(string memory){
        string memory result = store[count];
        return result;
    }

    function size() public view returns(uint){
        return count;
    }
}