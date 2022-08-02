// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


//used openzeppelin erc721 contract for the basic implementation of nft
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//inheriting the ERC721 contract
contract Rivera is ERC721 {

    uint256 public basePrice = 0 ether;
    uint256 public maxTokenIds = 10 ;
    uint256 public tokenIds;

    constructor () ERC721("Rivera", "rivera") {}
    //minting the token
    function mint() public payable{
        //checks the token limit is reached or not
        require(tokenIds < maxTokenIds, "Exceed maximum supply");
        //checks whether user is sending the base amount
        require(msg.value >= basePrice, "Sending Less Matic for purchase");
        //increaments the token id
        tokenIds += 1;
        _safeMint(msg.sender, tokenIds);
        //this will change the base price of the nft after three tokens minted
        if(tokenIds==3){
            setBasePrice();
        }
        
    }
    //function for changing the base price of the nft
    function setBasePrice() internal{
        basePrice = 1 ether;
    }

    receive() external payable {}
    fallback() external payable {}
}