// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract FlutterSolidityStore {
    // Store metadata
    string private storeName = "Tala Store";
    string private storeCover = "bafkreieta5xnb7s3itfiphrnijlbjv36zqrl2d6zlu6xtjm47bictdtrri";

    // Product counters
    uint private productNonce = 0;             // Used for generating unique UIDs
    uint public totalProducts = 0;             // Publicly accessible count of total created products

    // Base62 characters for UID encoding
    string internal constant _BASE62_ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    // Struct for storing product details
    struct Product {
        string uid;
        string name;
        string description;
        string image;
        bool sold;
        address payable owner;
        uint price;
        uint createdAt;
        uint soldAt;
    }

    // Mapping of product UID to product data
    mapping(string => Product) private storeProducts;

    // List of all product UIDs
    string[] private allProductUids;

    // Events emitted on product creation and purchase
    event CreatedProduct(
        string uid,
        string name,
        string description,
        string image,
        address indexed owner,
        uint price,
        uint createdAt
    );

    event ProductSold(
        string uid,
        string name,
        address indexed seller,
        address indexed buyer,
        uint price,
        uint soldAt
    );

    // Internal: Converts a uint to a Base62 string for compact readable UIDs
    function _toBase62(uint256 value) internal pure returns (string memory) {
        bytes memory alphabet = bytes(_BASE62_ALPHABET);
        bytes memory buffer = new bytes(64);
        uint length = 0;

        if (value == 0) {
            return string(abi.encodePacked(alphabet[0]));
        }

        // Encode into Base62
        while (value > 0) {
            buffer[length++] = alphabet[value % 62];
            value /= 62;
        }

        // Reverse buffer to get the correct Base62 order
        bytes memory result = new bytes(length);
        for (uint i = 0; i < length; i++) {
            result[i] = buffer[length - i - 1];
        }

        return string(result);
    }

    // Internal: Generates a unique UID for each product using sender, block data, and nonce
    function _generateUID(address sender, uint nonce) internal view returns (string memory) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                sender,
                nonce,
                block.timestamp,
                block.number,
                block.prevrandao,
                blockhash(block.number - 1)
            )
        );
        return _toBase62(uint256(hash));
    }

    // Internal: Validates product data before creation
    function _validateProductInput(
        string memory name,
        string memory description,
        string memory image,
        uint price
    ) internal pure {
        require(price > 0, "Invalid price: must be greater than 0");
        require(bytes(name).length > 3, "Invalid name: must be > 3 characters");
        require(bytes(description).length > 10, "Invalid description: must be > 10 characters");
        require(bytes(image).length > 10, "Invalid image URL: must be > 10 characters");
    }

    // Public: Creates a new product and emits CreatedProduct event
    function createProduct(
        string memory name,
        string memory description,
        string memory image,
        uint price
    ) public {
        _validateProductInput(name, description, image, price);

        productNonce++;
        totalProducts++;

        string memory uid = _generateUID(msg.sender, productNonce);
        uint timestamp = block.timestamp;

        storeProducts[uid] = Product(
            uid,
            name,
            description,
            image,
            false,
            payable(msg.sender),
            price,
            timestamp,
            0
        );

        allProductUids.push(uid);

        emit CreatedProduct(uid, name, description, image, msg.sender, price, timestamp);
    }

    // Public: Purchases a product and emits ProductSold event
    function buyProduct(string memory uid) public payable {
        Product storage product = storeProducts[uid];

        require(!product.sold, "This product has already been sold");
        require(msg.sender != product.owner, "You cannot buy your own product");
        require(msg.value == product.price, "You must send the exact product price");

        address payable seller = product.owner;
        product.owner = payable(msg.sender);
        product.sold = true;
        product.soldAt = block.timestamp;

        seller.transfer(msg.value);

        emit ProductSold(uid, product.name, seller, msg.sender, product.price, block.timestamp);
    }

    // Public: Returns the details of a product by UID
    function getProduct(string memory uid) public view returns (Product memory) {
        Product memory product = storeProducts[uid];
        require(bytes(product.uid).length > 0, "Product not found");
        return product;
    }

    // Public: Returns all created products
    function getAllProducts() public view returns (Product[] memory) {
        uint length = allProductUids.length;
        Product[] memory result = new Product[](length);

        for (uint i = 0; i < length; i++) {
            result[i] = storeProducts[allProductUids[i]];
        }

        return result;
    }

    // Public: Returns all products owned by a specific address
    function getProductsByOwner(address owner) public view returns (Product[] memory) {
        uint countOwned = 0;

        // Count how many products belong to the owner
        for (uint i = 0; i < allProductUids.length; i++) {
            if (storeProducts[allProductUids[i]].owner == owner) {
                countOwned++;
            }
        }

        // Build the owned products array
        Product[] memory owned = new Product[](countOwned);
        uint index = 0;

        for (uint i = 0; i < allProductUids.length; i++) {
            Product memory p = storeProducts[allProductUids[i]];
            if (p.owner == owner) {
                owned[index] = p;
                index++;
            }
        }

        return owned;
    }

    // Public: Returns store metadata
    function storeInfo() public view returns (string memory name, string memory cover) {
        return (storeName, storeCover);
    }
}