// SPDX-License-Identifier: MIT   
pragma solidity ^0.8.15;     //  solidity'nin hangi versiyonda calistigimizi sagliyor evm'de ona gore kodu deploy ediyor


contract Selection{


struct Citizen{
  uint id;
  bool isVoted;


}

struct Candidate{
    uint citizenId;
    uint voteCount;

}

mapping(uint => Candidate) candidateList;
mapping (uint=> Citizen)  citizenList;
mapping (uint =>Citizen) votedCitizenList;
bool SelectionAvailable; // default value is = "false" Always 


function createCitizen(uint _id) public returns(uint) {
   Citizen memory _temporaryCitizen = Citizen(_id , false);
   citizenList[_id]=_temporaryCitizen;
   return _id;
}
 
function getCitizen(uint _id) public view  returns(Citizen memory){
  return citizenList[_id];
}

function createCandidate(uint256 _id) public returns(uint256){
    Candidate memory _temporaryCandidate = Candidate(_id,0);
    candidateList[_id] = _temporaryCandidate;
    return _id;
    }

    function getCandidateVoteCount(uint _id) public view returns(uint){
        return candidateList[_id].voteCount;
    }


    function vote(uint _citizenId, uint _candidateId) public  returns(uint , uint){
        // check selection is available?
        require(SelectionAvailable != true,"Selection is not available at this time.");

        // check isVoted true
        require(citizenList[_citizenId].isVoted != true,"This candidate already voted.");

        // increase  vote count on candidate 
        candidateList[_candidateId].voteCount +=1;

        // set isvoted to true on citizen 

      citizenList[_citizenId].isVoted =true;
     // returns
      return (_citizenId,_candidateId);

    }




}