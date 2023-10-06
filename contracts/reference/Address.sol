// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Address {

    // 변수명의 대소문자가 포함된 경우 사용 불가
    // address public failUser = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    address public user = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    // ethereum 을 주고받는 컨트랙트 주소나 EOA(외부 소유 계정, 메타마스크/카이카스에서 만든 계정) 같은 경우
    // payable을 명시해줘야만 돈의 이동이 가능함.
    address payable public payable_user = payable(user);

    function sendETH() public payable {
        // 1 ETH
        // payable 로 캐스팅하지 않으면 전송 실패함.
        // user.transfer(1000000000000000000);

        payable_user.transfer(1000000000000000000);
    }

    function getBalance() public view returns(uint) {
        return user.balance;
    }

}