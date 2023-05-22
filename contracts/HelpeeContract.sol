// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* The Helpee smart contract implementation allowing users to:
* 1. Post questions
* 2. Reply to questions
* 3. Reward answers by sending funds to the author
*/
contract HelpeeContract {

    // Represents an user
    struct User {
        address payable userAddress;
        bytes32 name;
    }

    // Represents a Question
    struct Question {
        uint id;
        User user;
        bytes32 text;
        mapping (uint => Answer) answers;
    }

    // Represents an Answer
    struct Answer {
        Question question;
        User user;
        bytes32 text;
        uint reward;
    }

    // List of Questions
    mapping (uint => Question) private questions;

    // List of Users
    mapping (uint => User) private users;

    // ID counter
    uint idCounter = 0;

    /*
    * This method registers a user
    * @address User wallet address
    * @name User name
    */
    function registerUser(address payable _walletAddress, bytes32 _name) public returns (uint id) {

        // Validate mandatory inputs
        require(_walletAddress != address(0), "Wallet Address is mandatory");
        require(_name[0] != 0, "User name is mandatory") ;
        
        // Fills the User struct
        User memory newUser = User({
            userAddress : _walletAddress,
            name : _name
        });

        // Adds the user to the User list
        users[idCounter + 1] = newUser;

        // Increment the counter
        idCounter++;

        // Returns the id of registered user
        return idCounter;

    }

}