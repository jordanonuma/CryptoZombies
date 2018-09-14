pragma solidity ^0.4.19;

import "./ZombieFactory.sol";

contract KittyInterface {

  // To simulate zombie eating the CryptoKitty, reads the CryptoKitties data
  // from variable `genes` in function getKitty().
  function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
}

// ZombieFeeding.sol inherits from ZombieFactory.sol (previously Contract.sol)
contract ZombieFeeding is ZombieFactory {

  // Declares variable `kittyContract` from contract KittyInterface{}
  KittyInterface kittyContract;

  // Function setKittyContractAddress() will allow us to setKittyContractAddress
  // and change the CryptoKitties contract address in the future if necessary.
  function setKittyContractAddress(address _address) external {
    kittyContract = KittyInterface(_address);
  }

  function feedAndMultiply(uint _zombieId, uint _targetDna, string _species) public {

    // Makes sure sender is this zombie's owner.
    require(msg.sender == zombieToOwner[_zombieId]);

    // Declares local `Zombie` struct named `myZombie` (storage pointer).
    // Sets variable to be equal to index _zombieId in our `zombies` array.
    Zombie storage myZombie = zombies[_zombieId];

    // First we need to make sure that _targetDna isn't longer than 16 digits.
    // To do this, we can set _targetDna equal to _targetDna % dnaModulus to only take the
    // last 16 digits.
    _targetDna = _targetDna % dnaModulus;

    // Next our function should declare a uint named newDna, and set it equal to
    // the average of myZombie's DNA and _targetDna (as in the example above).
    uint newDna = (myZombie.dna + _targetDna) / 2;

    // Compares the keccak256 hashes of `_species` and the string "kitty"
    if (keccak256(_species) == keccak256("kitty")){
      // Replaces the last 2 digits of DNA with 99 if species is a kitty.
          // Example: Assume newDna is 334455.
          // Then newDna % 100 is 55, so newDna - newDna % 100 is 334400.
          // Finally add 99 to get 334499.
      newDna = newDna - newDna % 100 + 99;
    }

    // Calls function _createZombie from ZombieFactory.sol with parameters
    // "NoName" as name and averaged `newDna` as Dna. Note: no _underscores because
    // these are public variables. Also not sure why DNA isn't all caps here.
    _createZombie("NoName", newDna);
  } // end of function feedAndMultiply()

  // Public function `feedOnKitty` will take 2 uint parameters, `_zombieId` and
  // `_kittyId`.
  function feedOnKitty(uint _zombieId, uint _kittyId) public {

    // Declare integer `kittyDna`.
    uint kittyDna;

    // Calls function kittyContract.getKitty() with _kittyId.
    //    * Stores genes in kittyDna.
    //    * getKitty() returns 10 variables, we only want the 10th, `genes`.
    //    * `genes` will be saved as `kittyDna`.
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);

    // Calls function `feedAndMultiply` passing variables `_zombieId` and `kittyDna`.
    // Appends parameter "kitty" to the end.
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  } // end of function feedOnKitty()
} // end of contract ZombieFeeding{}
