// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Todo {
    uint internal id = 0;
    mapping (address => mapping (uint => string)) internal todos;
    event TodoAdded(address _address, uint _id);
    event TodoEdited(address _address, uint _id);
    event TodoDeleted(address _address, uint _id);

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
    function getTodo(uint _id) public view returns (string memory) {
        require(
            bytes(todos[msg.sender][_id]).length != 0, 
            "That todo does not exist"
        );
        return todos[msg.sender][_id];
    }
    function getTodos() public view returns (mapping (uint => string) memory) {
        return todos[msg.sender];
    }
    // NOTE - if delete array does not delete the element,
    // how is possible to save storage using the not deleted
    // elements?
    function deleteTodo(uint _id) public {
        require(
            bytes(todos[msg.sender][_id]).length != 0, 
            "That todo does not exist"
        );
        delete todos[msg.sender][_id];
        emit TodoDeleted(msg.sender, _id);
    }
}