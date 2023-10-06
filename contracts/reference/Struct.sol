// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Struct {

    struct Product {
        string name;
        uint price;
    }

    Product public mainProduct;
    uint public maxProductCount;

    // 처음 네트워크에 배포할 때 초기값 설정할 때 사용
    // 추후에 호출 불가하며, 네트워크 배포 시점 1회에만 작동함.
    constructor() {
        maxProductCount = 1000;
    }

    function initProduct() public {
        Product memory firstProduct;
        firstProduct = Product("toy1", 10);
    }

    function setMainProduct(string memory _name, uint memory _price) public {
        mainProduct.name = _name;
        mainProduct.price = _price;
    }

    function getMainProductPrice() public view returns(uint) {
        return mainProduct.price;
    }

}