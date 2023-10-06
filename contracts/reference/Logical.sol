// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Math {
    function plusData(uint a, uint b) external returns(uint) {
        return a + b;
    }
}


contract Logical {

    uint public minimalPrice = 1000;

    mapping (int => address) public owner;

    // 조건문
    function conditional(uint ask_price) public {
        if(ask_price > minimalPrice) {
            owner[1] = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        } else {
            // fail 일 경우 아래와 같이 revert() 함수 사용함.
            revert();
            // revert("message");
        }
    }

    // 반복문
    // for / while / do-while 문 존재함.
    // break / continue 동일함.




    Math math = new Math();
    address payable temp_address = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    // try-catch 문
    // 다른 컨트랙트를 호출한 경우에만 사용할 수 있음.
    function callOtherContract(address to) external {

        try math.plusData(10) returns(uint result) {
            temp_address.transfer(result);
        } catch {
            revert();
        }
    }

}
