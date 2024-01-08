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

     // Modifier for only owner
    modifier  onlyOwner() {
        // Checks if the function caller is the owner
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    /*
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

    /*
    * @dev Buy product from the shop
    * @param _NumberProducts number of products to buy
    */
    function buyProduct(uint _NumberProducts) public payable {
        // Checks if the value sent is enough
        if (msg.value >= Price * _NumberProducts) {
            // revet if not enough money
            revert("Not enough money");
        }
        // Checks if there are enough products 
        if(_NumberProducts > NumberProducts) {
            // revert if not enough products
            revert("Not enough products");
        }
        // Decrease the number of products
        NumberProducts -= _NumberProducts;
        // Transfer the money to the owner
        owner.transfer(msg.value);
    }

}
