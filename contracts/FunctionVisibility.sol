// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FunctionVisibility {

    uint8 private data = 255;
    uint8 public data = 255;

    // 외부 공개 안함, 상속된 contract 에서 보이지 않음. 내부에서 사용 가능함.
    function setData(uint8 _data) private {
        data = _data;
    }

    // 외부 공개 안함, 상속된 contract 에서 보임. 내부에서 사용 가능함. (protected)
    function setData(uint8 _data) internal {
        data = _data;
    }

    // 외부 공개함, 상속된 contract 에서 보임. 내부에서 사용 가능함.
    function setData(uint8 _data) public {
        data = _data;
    }

    // 외부 공개함, 상속된 contract 에서 보이지 않고, 내부에서도 사용 불가함.
    function setData(uint8 _data) external {
        data = _data;
    }

}