// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Array {

    // [1,2,3,4]
    // 가변적
    int[] public intList = [1,2,3,4];
    // 고정적
    int[3] public int3List = [1,2,3];

    int public lastData = intList.pop();
    int public secondData = intList[1];

    // [1,2,3,4]
    function deleteTest() public {

        // delete는 배열의 원소를 없애는 것이 아닌 내부 값을 0으로 변경함.
        delete intList[1]; // [1,0,3,4]
    }

    struct Product {
        string name;
        uint price;
    }
    Product[] public productList;

}