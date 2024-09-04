// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;


contract buymeacoffee {

    //events
   event newmemo(

     address indexed from,
     uint256 timestamp,
     string name,
     string message
   );

   //struct

   struct Memo{
     address from;
     uint256 timestamp;
     string name;
     string message;
   }
   
   //list of memos
   Memo[] memos;

   //address of owner
   address payable owner;

   //owner deployment
   constructor(){
    owner=payable(msg.sender);
   }
  

  //function to buy coffee
   function buycoffee(string memory _name,string memory _message) public payable {
    require(msg.value>0,"cant buy enough coffee with 0 eth");

    memos.push(Memo(
        msg.sender,
        block.timestamp,
        _name,
        _message
    ));
    emit newmemo(
        msg.sender,
        block.timestamp,
        _name,
        _message
    );
   }

   //withdraw the tips
   function withdrawtips() payable public{
    
     require(owner.send( address(this).balance));
   }
   

   //gets the memo
   function getmemos() public view returns(Memo[] memory) {
  return memos;
   }



}
