pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    // Public `Zombie` struct named `zombies`
    Zombie[] public zombies;

    function createZombie(string _name, uint _dna) {
        // start here
    }

}
