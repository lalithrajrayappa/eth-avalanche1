// SPDX-License-Identifier: MIT
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
