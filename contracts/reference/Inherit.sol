// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Seller {
    address private seller;
    string private location;

    constructor(address _seller) {
        seller = _seller;
    }

    function getSeller() public view returns(address) {
        return seller;
    }
}

contract Car {
    string private type_;
    uint8 private door;
    uint private price;

    constructor(string memory _type, uint8 _door, uint _price) {
        type_ = _type;
        door = _door;
        price = _price;
    }

    function getDoor() public view returns(uint8) {
        return door;
    }

    function getPrice() public view virtual returns(uint) {
        return price;
    }
}

// 상속 예약어 is
// 오버라이딩 처리 가능, 대신 부모 함수명에는 virtual / 자식 함수명에는 override 예약어를 추가해줘야 함.
contract Benz is Car("suv", 4, 10000) {
    string private model;
    address private owner;
    uint private premium;

    constructor(string memory _model, uint _premium) {
        model = _model;
        owner = msg.sender;
        premium = _premium;
    }

    function getModel() public view returns(string memory) {
        return model;
    }

    function getPrice() public view override returns(uint) {
        return premium;
    }

    // 부모 객체에 있는 가격 정보를 가져다 쓰고 싶은 경우 super 예약어 사용
    function getCarPrice() public view returns(uint) {
        return super.getPrice();
    }
}

// 다중상속은 , 로 구분하여 추가 가능함.
// 상속을 중첩하는 방식으로도 처리 가능함.( Seller > Car > Audi )
contract Audi is Car("small", 4, 10000), Seller(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266) {
    string private model;
    address private owner;

    function getModel() public view returns(string memory) {
        return model;
    }
}