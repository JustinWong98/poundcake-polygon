//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Payments {
    // constructor will init the tokenId views to 0
    // constructor() {}

    // mapping of the tokenId to the number of views
    mapping(uint => uint) public totalViewCount;
    // helper functions for each tier

    function tierOnePayment(address user, address owner) private {}

    function tierTwoPayment(address user, address owner) private {}

    function tierThreePayment(address user, address owner) private {}

    function payment(address user, uint256 fontId, uint256 viewCount) public {
      totalViewCount[fontId] += viewCount
      // arbitrary viewcounts
      // if totalViewCount[fontId] > 100 {}
      // if totalViewCount[fontId] > 1000 {}
      // if totalViewCount[fontId] > 10000 {}
    }
}
