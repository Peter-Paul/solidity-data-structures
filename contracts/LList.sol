// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Node {
    string private e;
    bool private ie = true; // is end of the list
    Node private n; // next node is undefined by default
    constructor(string memory _element) public{
        e = _element;
    }

    function isLastNode() public view returns(bool){
        return ie;
    }

    function next() public view returns(Node){
        return n;
    }

    function element() public view returns(string memory){
        return e;
    }

    function appendNext(Node _element) public { 
        // adds next node and hence isn't the end of list
        n = _element;
        ie = false;
    }

    function replaceNext(Node _element) public {
        n=_element;
    }
}

contract LList {
    int length = 0;
    Node top;
    constructor(string memory _element) public{
        top = new Node(_element);
    }

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

    function size() public view returns(int){
        return length;
    }

    function head() public view returns(Node){
        return top;
    }

    function add(string memory _element) public {
        Node node = new Node(_element);
        Node currentNode = top;
        while(currentNode.isLastNode()){
            currentNode=currentNode.next();
        }
        currentNode.appendNext(node);
        length++;
    }

    function remove(string memory _element) public {
        Node currentNode = top;
        Node previousNode;
        if( stringsEquals( currentNode.element(), _element) ){
            top = currentNode.next();
        }else{
            while( stringsEquals( currentNode.element(), _element) == false ){
                previousNode=currentNode;
                currentNode=currentNode.next();
            }
            previousNode.replaceNext(currentNode.next());
        }
        length--;
    }

    function isEmpty () public view returns(bool){
        return length==0;
    }

    function indexOf(string memory _element) public view  returns(int index){
        Node currentNode = top;
        index = -1;

        if( stringsEquals( currentNode.element(), _element) ){
            return 0;
        }else{
            currentNode = currentNode.next();
            index++;
            while(currentNode.isLastNode()){
                index++;
                if( stringsEquals( currentNode.element(), _element) ){
                    return index;
                }
                currentNode = currentNode.next();
            }
        }
        return -1;
    }
}