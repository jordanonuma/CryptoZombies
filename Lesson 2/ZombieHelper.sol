pragma solidity ^0.4.19;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    // Requires struct zombies[_zombieId].level is greater than or equal to _level.
    require(zombies[_zombieId].level >= _level);
    _;
  } // end of modifier aboveLevel

} // end of contract ZombieHelper{}
