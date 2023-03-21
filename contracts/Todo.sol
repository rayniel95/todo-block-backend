// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract Todo {
    uint internal id = 0;
    mapping (address => mapping (uint => string)) internal todos;
    struct Tuple {
        uint id;
        string text;
    }
    event TodoAdded(address _address, uint _id);
    event TodoEdited(address _address, uint _id);
    event TodoDeleted(address _address, uint _id);

    constructor() {}

    function addTodo(string memory text) public {
        todos[msg.sender][id] = text;
        emit TodoAdded(msg.sender, id);
        id++;
    }
    function editTodo(uint _id, string memory newText) public {
        require(
            bytes(todos[msg.sender][_id]).length != 0, 
            "That todo does not exist"
        );
        todos[msg.sender][_id] = newText; 
        emit TodoEdited(msg.sender, _id);
    }
    function getTodo(uint _id) public view returns (string memory) {
        require(
            bytes(todos[msg.sender][_id]).length != 0, 
            "That todo does not exist"
        );
        return todos[msg.sender][_id];
    }
    function getTodos() public view returns (Tuple[] memory) {
        Tuple[] memory result = new Tuple[](id+1);
        uint index;
        for (uint _id = 0; _id <= id; _id++) {
            if (bytes(todos[msg.sender][_id]).length != 0) {
                result[index] = Tuple(_id, todos[msg.sender][_id]);
                index++;
            }
        }
        return result;
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