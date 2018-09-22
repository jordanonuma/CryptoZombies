pragma solidity ^0.4.19;
import "./ZombieHelper.sol";

contract ZombieBattle is ZombieHelper {

  uint randNonce = 0;

  // Function randMond() creates a random number that will be used to determine
  // zombie battle outcomes.
  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;

    // keccak256 takes  hash of now, msg.sender, and randNonce.
    return uint(keccak256(now, msg.sender, randNonce)) % _modulus;
  }

} // end Contract ZombieBattle {}
