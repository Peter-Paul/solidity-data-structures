// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Set {
    struct Store {
        string[] store;
    }

    Store collection;

    function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
        bytes memory b1 = bytes(s1);
        bytes memory b2 = bytes(s2);
        uint256 l1 = b1.length;
        if (l1 != b2.length) return false;
        for (uint256 i=0; i<l1; i++) {
            if (b1[i] != b2[i]) return false;
        }
        return true;
    }

    function indexOf(string memory _value) private view returns(uint index){
        uint length = collection.store.length;
        for (uint i=0; i<length; i++){
            if (stringsEquals(collection.store[i], _value)){
                index=i;
                return index;
            }
        }
    }

    function has(string memory _value) public view returns(bool){
        uint length = collection.store.length;
        for (uint i=0; i<length; i++){
            if (stringsEquals(collection.store[i], _value)){
                return true;
            }
        }
        return false;
    }
    
    function size() public view returns(uint){
        return collection.store.length;
    }

    function values() public view returns(string[] memory){
        return collection.store;
    }

    function add(string memory _value) public{
        if (has(_value) == false){
            collection.store.push(_value);
        }
    }

    function remove(string memory _value) public{
        if (has(_value)){
            delete collection.store[indexOf(_value)];
        }
    }

    function union(Set otherset) public returns(Set){
        Set unionSet;
        string[] memory set1 = values();
        string[] memory set2 = otherset.values();

        for(uint i=0; i<set1.length; i++){
            unionSet.add(set1[i]);
        }

        for(uint i=0; i<set2.length; i++){
            unionSet.add(set2[i]);
        }

        return unionSet;
    }

    function intersection(Set otherset) public returns(Set){
        Set intersectionSet;
        string[] memory thisSet = values();

        for(uint i=0; i<thisSet.length; i++){
            if ( otherset.has(thisSet[i]) ){
                intersectionSet.add(thisSet[i]);
            }
        }

        return intersectionSet;
    }

    function difference(Set otherset) public returns(Set){
        Set differenceSet;
        string[] memory thisSet = values();

        for(uint i=0; i<thisSet.length; i++){
            if ( otherset.has(thisSet[i]) == false ){
                differenceSet.add(thisSet[i]);
            }
        }
        
        return differenceSet;
    }

    function subset(Set otherset) public view returns(bool){
        string[] memory thisSet = values();

        for(uint i=0; i<thisSet.length; i++){
            if ( otherset.has(thisSet[i]) == false ){
                return false;
            }
        }
        
        return true;
    }
    
}