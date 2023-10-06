// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Function {

    uint8 private data = 255;

    // state 를 변경하는 setter 함수만 트랜잭션을 호출함.
    // state 변경을 위해서는 모든 노드가 변경되는 값 검증을 해야하기 때문에 트랜잭션이 발생되는 것임.
    function setData(uint8 _data) public {
        data = _data;
    }

    // state 를 변경하지 않는 getter 함수는 트랜잭션을 호출하지 않음.
    // getter 는 단순히 state 만 꺼내서 전달하면 되므로 검증이 필요하지 않음.
    // 때문에 트랜잭션을 호출하지 않음.
    // returns 뒤에 어떤 자료형을 반환할 지 작성함.
    function getData() public view returns(uint8) {
        return data;
    }


    // 트랜잭션 : 암호화폐 지갑에 트랜잭션을 호출

}