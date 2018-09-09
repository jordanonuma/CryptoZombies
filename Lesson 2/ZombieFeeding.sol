pragma solidity ^0.4.19;

import "./ZombieFactory.sol";

// ZombieFeeding.sol inherits from ZombieFactory.sol (previously Contract.sol)
contract ZombieFeeding is ZombieFactory {



function feedAndMultiply(uint _zombieId, uint _targetDna) public {
  
  // Makes sure sender is this zombie's owner.
  require(msg.sender == zombieToOwner[_zombieId]);
  // Declares local `Zombie` named `myZombie` (storage pointer).
  // Sets variable to be equal to index _zombieId in our `zombies` array.
  Zombie storage myZombie = zombies[_zombieId];

}
}
