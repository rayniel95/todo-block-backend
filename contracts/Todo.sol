// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Todo {
    uint internal id = 0;
    mapping (address => mapping (uint => string)) internal todos;
    constructor() {}

    function addTodo(string memory text) public {
        require(
            bytes(todos[msg.sender][id]).lenght == 0, 
            "You are trying to add an existing todo"
        );
        todos[msg.sender][id] = text;
        id++;
    }
    function editTodo(uint id, string memory newText) public {
        require(todos[msg.sender][id])
    }
    function getTodo() public view returns (TodoTask memory) {
        
    }
    function getTodos() public view returns (TodoTask[] memory) {
        
    }
    // NOTE - if delete array does not delete the element,
    // how is possible to save storage using the not deleted
    // elements?
    function deleteTodo() public {
        
    }
}