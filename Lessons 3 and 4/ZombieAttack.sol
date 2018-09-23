pragma solidity ^0.4.19;
import "./ZombieHelper.sol";

contract ZombieBattle is ZombieHelper {

  uint randNonce = 0;
  uint attackVictoryProbability = 70; // Attacking zombie has a 70% chance of winning.

  // Function randMond() creates a random number that will be used to determine
  // zombie battle outcomes.
  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;

    // keccak256 takes  hash of now, msg.sender, and randNonce.
    return uint(keccak256(now, msg.sender, randNonce)) % _modulus;
    
  } // end of function randMod()

  // If the attacking zombie wins, it levels up and spawns a new zombie.
  // If it loses, nothing happens (except its lossCount incrementing).
  // Whether it wins or loses, the attacking zombie's cooldown time will begin.
  function attack(uint _zombieId, uint _targetId) external {

  } // end of function attack()

} // end Contract ZombieBattle {}
