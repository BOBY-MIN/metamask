// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract PureView {

    uint8 /* storage */ private data = 255;

    // 전역 변수에 선언된 state 값을 사용하는 경우 view
    // 블록체인 내에 실제 저장된 값을 사용할 때는 view
    function getData() public view returns(uint8) {
        return data;
    }

    // 전역변수가 아닌 함수 내 메모리 데이터 사용하는 경우 pure
    // state 를 쓰지 않는 순수한 변수는 pure
    function getPureData(string memory _data;) public pure returns(string memory) {
        uint8 memory temp_data = 9;
        return temp_data;
    }

}