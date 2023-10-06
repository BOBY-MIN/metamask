// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Mapping {

    // ERC20 잔액
    // contract 내에 mapping 값에 잔액이 보관됨.
    mapping(address => int) public balance;
    // key - value 형태
    // key 값에 대한 중복이 발생하지 않음.
    // 중복이 발생하지 않으므로 값이 덮어씌워짐. 주의 필요함.

    function setMapping() public {
        balance["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"] = 1000;
    }

    function getMapping() public returns(int) {
        return balance["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"];
    }

}