// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Rivera is ERC721 {

    uint256 public basePrice = 0 ether;
    uint256 public maxTokenIds = 10 ;
    uint256 public tokenIds;

    constructor () ERC721("Rivera", "rivera") {}

    function mint() public payable{
        require(tokenIds <= maxTokenIds, "Exceed maximum supply");
        require(msg.value >= basePrice, "Sending Less Matic for purchase");
        tokenIds += 1;
        if(tokenIds==3){
            setBasePrice();
        }
        _safeMint(msg.sender, tokenIds);
        
    }

    function setBasePrice() internal{
        basePrice = 1 ether;
    }

    receive() external payable {}
    fallback() external payable {}
}