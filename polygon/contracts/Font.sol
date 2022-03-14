//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
// token should be burnt if we need to destroy the font/prevent it from being accessed(?)
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
// to pay royalties to font creator
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Font is ERC721Burnable, ERC721Pausable, ERC721Royalty {
    using Counters for Counters.Counter;
    Counters.Counter private _fontIds;

    constructor() public ERC721("GameItem", "ITM") {}

    // We need to mint an NFT, msg.sender is who we pay royalties to
    // The tokenURI on an NFT is a unique identifier of what the token "looks" like. A URI could be an API call over HTTPS, an IPFS hash, or anything else unique.
    // e.g.
    //     {
    //     "name": "name",
    //     "description": "description",
    //     "image": "https://ipfs.io/ipfs/QmTgqnhFBMkfT9s8PHKcdXBn1f5bG3Q5hmBaR4U6hoTvb1?filename=Chainlink_Elf.png",
    //     "attributes": [
    //         {
    //             "trait_type": "trait",
    //             "value": 100
    //         }
    //     ]
    // }
    // the URI will be passed in (attributes of the font)
    // should we store the link to the font as a json with price and description and the file for the font or just the font and map pricing and description on our smart contract? Seems like the first is betterfor space consideration.
    // https://betterprogramming.pub/assigning-data-to-nft-tokens-46865a3fde39
    function mintFont(string memory fontLink) public {
        _fontIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, fontLink);
    }

    // when someone buys a font, we award it to them
    function awardFont(uint256 requestedFontId)
        public
        payable
        returns (uint256)
    {
        // get the font pricing based off the metadata in URI
        string fontLink = ownerOf(requestedFontId);
        // require price sent is not lower than the pricing of URI
        // require(msg.value >= price);
    }

    // Can we burn a font? The font file will still be passed around a lot
}
