pragma solidity ^0.4.25;

import "./ZombieAttack.sol";
import "./ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    // ownerZombieCount[] mapping is from Contract ZombieFactory {}.
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    // zombieToOwner[] mapping is from Contract ZombieFactory {}.
    return zombieToOwner[_tokenId];
  } // end of function ownerOf()

  function _transfer(address _from, address _to, uint256 _tokenId) private {
      ownerZombieCount[_to]++;
      ownerZombieCount[_from]--;

      // Changes the zombieToOwner mapping [from Contract ZombieFactory {}] for this
      // so for every '_tokenId' zombie, the mapping shows '_to' owner.
      zombieToOwner[_tokenId] = _to;

      // Fires 'Event Transfer' in ERC721.sol
      Transfer(_from, _to, _tokenId);
  } // end of function _transfer() private {}

  function transfer(address _to, uint256 _tokenId) onlyOwnerOf(_tokenId) public {
    // Public function transfer() is restricted to msg.sender.
    // transfer() calls private function _transfer(), restricted to callable by
    // functions within this contract.
    _transfer(msg.sender, _to, _tokenId);
  } // end of function transfer() public {}

  function approve(address _to, uint256 _tokenId) public {

  }

  function takeOwnership(uint256 _tokenId) public {

  }
}
