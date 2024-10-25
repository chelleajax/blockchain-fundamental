// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// CHALLENGE
// IDENTIFY SECURITY RISK IN THIS FUNCTION

contract TPS {
    // struct harus singular
    struct Candidate {
        string name;
        // uint ipk;
        // string partai;
        uint voteCount;
        // string daddysName;
    }

    struct Voter{
        uint age;
        // address delegate;
        bool hasVoted;
    }

    address public chairperson;

    Candidate[] candidates;

    // 1 wallet address bakal dpt 1 struct namanya voter
    mapping(address => Voter) voters;

    // memory temporary, storage permanen
    // temporary karena baskal dipindahin di array candicates juga

    // constructor cuman dipanggil sekali pas di deploy
    constructor(string[] memory candidatesName) {
        chairperson = msg.sender;

        for(uint i=0; i < candidatesName.length; i++){
            candidates.push(Candidate({
                name: candidatesName[i],
                voteCount: 0
            }));
        }
    }

    // whitelist
    function giveVotingRight(address _voterAddress, uint _voterAge) public {
        require(msg.sender == chairperson, "only chairperson can give the right to vote");
        require(!voters[_voterAddress].hasVoted, "The voter has already voted");
        voters[_voterAddress].hasVoted = false;
        voters[_voterAddress].age = _voterAge;
    }

    function voting(uint _votedCandidate) public {
        Voter storage theOneWhoWillVote = voters[msg.sender];

        require(!theOneWhoWillVote.hasVoted, "The vote has already voted");
        theOneWhoWillVote.hasVoted = true;
        candidates[_votedCandidate - 1].voteCount++;
    }
}