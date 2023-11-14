# Eth-Avalanche module1

This is a sample solidity code to handle errors.You can use this to implement various functionalities such as checking if the minimum balance was maintained within 15 days,to check if the owner of the contract is calling the function and to check if the account balance is greater than the minimum balance.

## Description

We have first initialized two public variables min_balance and acc_balance and also a variable owner.Then we have assigned the owner variable inside the constructor to the address of the person deploying the contract.We have a maintain_bal function which checks if the time is less than or equal to 15 if it is false then it would execute the string present as the argument in the require function.Then we have the access_call function used to check if the person calling the function is the owner who deployed the contract and atlast we have bal_check function to check if the account balance is greater than the minimum balance.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., avalanche1.sol). Copy and paste the following code into the file:

javascript
//1.SPDX-License-Identifier: MIT
pragma solidity 0.8.14;
contract err_handlers{
   
    uint public min_balance=100;
    address owner;
    uint public acc_balance=90;

    constructor (){
      owner=msg.sender;
    }
    //time in days
    function maintain_bal(uint time)public pure returns(bool) {
        require(time<=15,"You need to maintain minimum balance within 15 days else your account will get deactivated");
        return true;
    }
    function access_call()public view returns(string memory){
        if(msg.sender!=owner){
            revert("Only the owner can call this function");
        }
       
        return "Hello, I am Owner";
    }
    function bal_check()public view returns(bool){
        assert(acc_balance>min_balance);
        return true;
    }
}


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.14" (or another compatible version), and then click on the "Compile avalanche1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "avalanche1" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it .

* Here the "require" function checks if the incoming time argument during function call is less than or equal to 15 if it is true the it goes to the next line and returns true otherwis "You need to maintain minimum balance within 15 days else your account will get deactivated" would be executed.
* The "revert" is executed when the if condition is true the function execution stops, and any state changes made during the execution are rolled back. The specified error message "Only the owner can call this function" is included in the revert, providing context about why the transaction failed.
* The "assert" is used to check if acc_bal is greater than min_bal if it is true then the next line of code is executed and hence returns true otherwise if the assert statement is false then the function as a whole will not be executed.

## Authors

Lalit R

[lalithrajrayappa@gmail.com]

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
