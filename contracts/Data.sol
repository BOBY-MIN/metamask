// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract DataType {

    // solidity 는 C++ 기반

    bool public data1 = false;

    // int 는 음수/양수 가능
    int public data2 = -1;
    // uint 양수만 가능
    uint public data3 = 10;

    // int / long 보다 큰 숫자 필요 시 사용
    uint256 public data4 = 10000000000000000000000; // 0 ~ 2^256 - 1 까지 지원
    int256 public data5 = -10000000000000000000000; // -2^255 ~ 2^255 - 1 까지 지원

    // int 보다 작은 숫자 필요 시 사용
    uint8 public data6 = 100; // 0 ~ 255
    int8 public data7 = -100; // -128 ~ 127

    // 블록체인에서 자료형의 크기는 gas price 에 영향을 주므로 필요한 크기만큼만 자료형을 선언하여 사용해야 함.
    // float 은 존재하지 않음. 소수점 사용할 수 없음.


    // 블록체인에서 string은 byte 값으로 저장됨.
    string public data8 = "test";
    byte public data9 = "test";

    // 주소값 기재 시 사용하는 자료형
    // 주소값 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5 앞에 0x 대신 hex 사용
    byte20 public data10 = hex"95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5";
    // 트랜잭션 hash 기재 시 사용하는 자료형
    byte32 public data11 = hex"4254e47b807831da5ba3a9b87ae4765773b982c6afdb4fac39074aabdc789b26";


    // 주소를 표기하기 위한 전용 자료형으로 adress 존재함.
    adress public data12 = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5;


}