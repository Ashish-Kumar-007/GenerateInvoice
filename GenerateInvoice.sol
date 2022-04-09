//SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.10;

contract GenerateInvoice{

//Stores Buyer Details
    struct buyer{
        string BuyerPAN;
        string name;
        address user;
        string purchaseItem;
        uint purchaseAmount;
        string purchaseDate;
    }
    //seller address and seller PAN
    struct sellerDetails{
        string sellerPAN;
        address sellerAddress;
    }

    //buyer pan mapping to buyer details
    mapping(string =>buyer) Buyers;

    //seller will be the person who deployed the contract
   address Deployer;

    constructor (){
        Deployer = msg.sender;  
    }

    sellerDetails Seller;

    //take input from seller about buyer
    function BuyItems(string memory _name, 
    string memory _BuyerPAN, 
    address _user, 
    string memory _purchaseItem, 
    uint _amount, 
    string memory _date) public{

        require(Deployer == msg.sender, "You are not the seller");
        Buyers[_BuyerPAN].BuyerPAN = _BuyerPAN;
        Buyers[_BuyerPAN].name = _name;
        Buyers[_BuyerPAN].user = _user;
        Buyers[_BuyerPAN].purchaseAmount = _amount;
        Buyers[_BuyerPAN].purchaseItem = _purchaseItem;
        Buyers[_BuyerPAN].purchaseDate = _date;
        
    }

    // Display the buyer invoice details
    function getInvoice(string memory _buyerPAN) public view returns(buyer memory){
    return (Buyers[_buyerPAN]);
    }

    function setSellerInfo(string memory _sellerPAN) public{
        Seller.sellerPAN = _sellerPAN;
        Seller.sellerAddress = Deployer;
    }
    
    //Display the seller details
    function getSellerInfo() public view returns(sellerDetails memory){
        return Seller;
    }
}
