pragma solidity ^0.4.25;

// The ERC721 standard is currently a draft (as of 29 September 2018), and there is no officially agreed-upon
// implementation yet. For this tutorial we're using the current version from OpenZeppelin's
// library, but it is possible it will change in the future before its official release.
// So consider this one possible implementation, but don't take it as the official standard
// for ERC721 tokens.

contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 _tokenId); //indexed _from and _to allows us to filter the Transfer event in index.html
  event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId); //indexed _owner and _approved allows us to filter the Approval event in index.html

  function balanceOf(address _owner) public view returns (uint256 _balance);
  function ownerOf(uint256 _tokenId) public view returns (address _owner);
  function transfer(address _to, uint256 _tokenId) public;
  function approve(address _to, uint256 _tokenId) public;
  function takeOwnership(uint256 _tokenId) public;
}
