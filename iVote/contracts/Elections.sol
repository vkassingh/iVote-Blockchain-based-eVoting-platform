//declare the version of solidity lang
pragma solidity ^0.4.24;

contract ElectionFact{

// create your own data type with struct
  struct ElectionDet{
    address deployedAddress; 
    string electionNo; 
    string electionDetails;
  }

  //store in key value pairs using mapping
  mapping(string => ElectionDetails) companyEmail;

  function createElection(){}

}

contract Election{
   
   //election authority address
    address election_authority;
    string election_name;
    string electionDescription;
    bool status;

    //election authority add where they deploy the contract
    constructor () public {} 
    //constructor : memory allocate karega data members ko.

}