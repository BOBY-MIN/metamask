// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.5.0;

contract Function {

    uint8 private data = 255; // 0 ~ 255

    // 4 버전에서는 uint8 에 범위를 초과하는 값을 더할 경우 0부터 다시 시작함.
    // 위와 같은 이유로 overflow 공격이 가능함.
    // 버전에 따라 보안 정도가 다르므로 코딩 방식도 달라져야 함.
    function setData(uint8 _data) public {
        data += 1;
    }

    function getData() public returns(uint8) {
        return data;
    }

}