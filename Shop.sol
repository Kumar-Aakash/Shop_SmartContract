//SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.4;

contract Shop {
    // Owner of the contract
    address payable public owner;
    // Number of products in the shop
    uint public NumberProducts;
    // Price for one product
    uint public Price;

    // Contructor of the contract
    constructor() {
        owner = payable(msg.sender);
        NumberProducts = 10;
        Price = 100;
    }
    * @dev Add prodcuts to the shop
    * @param _NumberProducts number of products to add 
    */
    function addProduct(uint _NumberProducts) public onlyOwner {
        NumberProducts += _NumberProducts;
    }
   
     /*
     * @dev Set price for product
     * @param _Price new price for product
     */
    function setPrice(uint _Price) public onlyOwner {
        assert(_Price > 0);
        Price = _Price;
    }


}
