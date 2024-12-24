pragma solidity ^0.8.27;

contract Marketplace {
    struct Product {
        uint256 id;
        string name;
        string description;
        uint256 price;
        address payable seller;
        bool sold;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductListed(
        uint256 indexed productId,
        string name,
        uint256 price,
        address seller
    );
    event ProductSold(uint256 indexed productId, address buyer);

    constructor() {
        productCount = 0; // 初始化商品计数器
    }

    function listProduct(
        string memory _name,
        string memory _description,
        uint256 _price
    ) public {
        products[productCount] = Product(
            productCount,
            _name,
            _description,
            _price,
            payable(msg.sender),
            false
        );
        emit ProductListed(productCount, _name, _price, msg.sender);
        productCount++;
    }

    function buyProduct(uint256 _productId) public payable {
        require(_productId < productCount, "Invalid product ID"); // 检查商品 ID 是否有效
        require(!products[_productId].sold, "Product already sold");
        require(msg.value == products[_productId].price, "Incorrect price");

        products[_productId].sold = true;
        (bool success, ) = products[_productId].seller.call{value: msg.value}(
            ""
        ); // 使用 call 进行安全的资金转移
        require(success, "Transfer failed."); // 检查转账是否成功

        emit ProductSold(_productId, msg.sender);
    }

    function getProduct(
        uint256 _productId
    ) public view returns (Product memory) {
        require(_productId < productCount, "Invalid product ID"); // 检查商品 ID 是否有效
        return products[_productId];
    }

    function getAllProducts() public view returns (Product[] memory) {
        Product[] memory allProducts = new Product[](productCount);
        for (uint i = 0; i < productCount; i++) {
            allProducts[i] = products[i];
        }
        return allProducts;
    }
}
