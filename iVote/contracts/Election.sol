//declare the version of solidity lang
pragma solidity ^0.4.24;

contract Election{

//create your own data type with struct
struct Candidate{
  uint id;
  string name;
  uint voteCount;
}

//store key value pairs like hashtable
//store counts that have voted
mapping(address => bool) public voters;

//store and the fetch candidates 
mapping(uint => Candidate) public candidates;

//store candidate counts
uint public candidatesCount;

//votedEvent will let the users know that someone has voted
//filter events with indexed
event votedEvent(
    
    uint indexed _candidateId;
);

function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
}

//update candidates mapping with count and name
function addCandidate( string _name) private {
    candidatesCount++;
    candidates[candidatesCount]= Candidate(candidatesCount, _name, 0);

}

//handle voting part
function vote(uint _candidateId) public {
 
 // must not have voted and we access the current account calling the function with msg.sender  
 require(!voters[msg.sender]);

 //require to be a valid candidate
 require(_candidateId>0 && _candidateId<= candidatesCount);

//record the voters vote
voters[msg.sender]= true;

//update vote count
candidates[_candidateId].voteCount++;

//invoke the voted event
votedEvent(_candidateId);

}

}
