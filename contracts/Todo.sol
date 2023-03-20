// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Todo {
    uint internal id = 0;
    mapping (address => mapping (uint => string)) internal todos;
    constructor() {}

    function addTodo(string memory text) public {
        todos[msg.sender][id] = text;
        id++;
    }
    function editTodo(uint _id, string memory newText) public {
        require(
            bytes(todos[msg.sender][_id]).length != 0, 
            "That todo does not exist"
        );
        todos[msg.sender][_id] = newText;    
    }
    function getTodo() public view returns (string memory) {
        
    }
    function getTodos() public view returns (string[] memory) {
        
    }
    // NOTE - if delete array does not delete the element,
    // how is possible to save storage using the not deleted
    // elements?
    function deleteTodo() public {
        
    }
}