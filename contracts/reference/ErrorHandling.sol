// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 컨트랙트 바깥이던 안이던 상관 없음.
error ZeroCheckError();

contract ErrorHandling {

    // 함수 뒤에 선언해주면 modifier 내부에 있는 검증이 통과해야만 함수를 실행함.
    modifier checkMinPrice() {
        // 해당 조건이 성립을 하는 지 안 하는지 체크할 때 사용
        require(msg.value > minPrice);
        _;
    }

    uint public minPrice = 10000;
    mapping(address => int) public orderList;

    // Modifier : 에러 처리가 발생하기 전 미리 체크하는 함수
    function test1() public payable checkMinPrice {
        // 함수명 뒤에 modifier 가 선언되었으므로 아래 검증 절차가 필요없어짐.
        // require(msg.value > minPrice);
        orderList[msg.sender] = msg.value;
    }

    function test2() public payable checkMinPrice {
        // 함수명 뒤에 modifier 가 선언되었으므로 아래 검증 절차가 필요없어짐.
        // require(msg.value > minPrice);
        orderList[msg.sender] = msg.value;
    }

    function order() external payable {

        // 참인 경우만 기재, 메시지 기재,
        require(msg.value != 0, "Msg.value must not be zero");
        // assert 문은 조건만 기재, 메시지는 기재하지 않음.
        assert(msg.value != 0); // Error 를 발생시키고 Transaction으로 인해 지금까지 변경된 state를 rollback 함.
        // revert 문은 조건문이 없음, 무조건 에러 발생시키고 state를 rollback 함.
        if(msg.value < minPrice) revert("Msg.value must not be zero");
        if(msg.value < minPrice) ZeroCheckError();

        orderList[msg.sender] = msg.value;
    }


    // 사용자가 컨트랙트 내에 존재하지 않는 함수를 호출할 때 사용됨.
    fallback() payable external {
        revert();
    }

    // 사용자 함수를 호출하지 않고 ETH를 컨트랙트에 전송할 때 사용됨.
    receive() payable external {
        revert();
    }

}