pragma solidity >=0.4.0 <0.6.0;

contract Ballot {
  //declares new complex type

  struct Voter {
    uint weight; //weight accumulated by delegation
    bool voted; //true if person has already voted
    address delegate; //person delegated to
    uint vote; //index of the voted proposal
  }

  //type for single proposal:
  struct Proposal {
    bytes32 name; //short name up to 32 bytes
    uint voteCount; //number of accumulated votes
  }

  address public chairperson;

  //declares state variable that stores voter struct for each possible address
  mapping(address => Voter) public voters;

  //dynamic sized array of proposal structs
  Proposal[] public proposals;

  ///Create a new ballot to choose one of the proposal names:
  constructor(bytes32[] memory proposalNames) public {
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

        // For each of the provided proposal names,
        // create a new proposal object and add it
        // to the end of the array.
        for(uint i = 0; i < proposalNames.length; i++){
          // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Proposal({
              name: proposalNames[i],
              voteCount: 0
              }));
        }
      }
    //give the right to vote on the ballot
    //may only be called by the chairperson
    function giveRightToVote(address voter) public {
      //if any reqires eval false, execution terminates and all changes are reverted
      require(
        msg.sender == chairperson,
        "only chairperson can give right to vote"
      );
      require(
        !voters[voter].voted,
        "The voter already voted"
      );
      require(voters[voter].weight == 0);
      voters[voter].weight = 1;
    }

    //delegate vote to the voters
    function delegate(address to) public {
      //assigns reference
      Voter storage sender = voters[msg.sender];
      require(!sender.voted, "You already voted");

      require(to != msg.sender, "Self-Delegation is allowed");

      while (voters[to].delegate != address(0)){
        to = voters[to].delegate;

        //found a loop in the delegation not allowed
        require(to != msg.sender, "Found loop in Delegation ");

      }

      sender.voted = true;
      sender.delegate = to;
      Voter storage delegate_ = voters[to];
      if(delegate_.voted){
        //if the delegate already voted this modifies voters[msg.sender].voted
        proposals[delegate_.vote].voteCount += sender.weight;
      }
      else{
        //if the delegate did not vote add to weight:
        delegate_.weight += sender.weight;
      }
    }

    function vote(uint proposal) public {
      Voter storage sender = voters[msg.sender];
      require(sender.weight != 0, "Has no right to vote");
      require(!sender.voted, "Already Voted");
      sender.voted = true;
      sender.vote = proposal;

      //if proposal is out of array range this will throw and revert
      proposals[proposal].voteCount += sender.weight;
    }

    //computes winnings
    function winningProposal() public view returns (uint winningProposal_){
      uint winningVoteCount = 0;
      for(uint p = 0; p < proposals.length; p++){
        if(proposals[p].voteCount > winningVoteCount){
          winningVoteCount = proposals[p].voteCount;
          winningProposal_ = p;
        }
      }
    }

    //calls winning proposal to get the index of the winner contained in the proposal array
    function winnerName() public view returns(bytes32 winnerName_){
      winnerName_ = proposals[winningProposal()].name;
    }
}
