pragma solidity ^0.4.19;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    // Requires struct zombies[_zombieId].level is greater than or equal to _level.
    require(zombies[_zombieId].level >= _level);
    _;
  } // end of modifier aboveLevel

  // For zombies level 2 and higher, users will be able to change their name.
  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]); //check if user is zombie owner
    zombies[_zombieId].name = _newName;
  } // end of function changeName()

  // For zombies level 20 and higher, users will be able to give them custom DNA.
  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]); //check if user is zombie owner
    zombies[_zombieId].dna = _newDna;
  } // end of function changeDna()

  // Function getZombiesByOwner() will return a user's entire zombie army, uint[] (an array of uint).
  function getZombiesByOwner(address _owner) external view returns(uint[]) {

  } // end of function getZombiesByOwner()

} // end of contract ZombieHelper{}
