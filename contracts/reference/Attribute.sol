// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Attribute {

    uint public block1 = block.basefee;
    uint public block2 = block.chainId;
    address payable public block3 = block.coinbase;
    uint public block4 = block.difficulty;
    uint public block5 = block.gaslimit;
    uint public block6 = block.number;
    uint public block7 = block.timestamp;

    function generateRandom() public view returns(uint8) {
        uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
        return number;
    }


    // 트랜잭션이 실행된 후에 남은 가스가 있는지 확인하는 함수
    // 연속되는 트랜잭션 처리 중 다음 트랜잭션 처리가 가능한 지 확인할 때 사용
    uint public msg1 = gasleft();

    bytes public msg2 = msg.data;
    address public msg3 = msg.sender;
    // methodId 값이 byte code로 들어감, 해당 코드가 sig임.
    bytes4 public msg4 = msg.sig;
    // 사용자가 전송한 이더리움의 크기
    uint public msg5 = msg.value;

    // 스마트 컨트랙스 상에서 msg.value 를 사용하기 위해서는 payable 이 꼭 선언되어 있어야 함.
    function checkValue() external payable {
        uint value = msg.value;
    }

    mapping(address => uint) private orderList;

    function newOrderList() external payable {
        orderList[msg.sender] = msg.value;
    }

    bytes4 private checkFunction;
    function newCheckFunction(address sender, uint price) external returns(bool) {
        bytes selector = bytes4(keccak256("newOrderList()"));
        if(selector == msg.sig) {
            return true;
        }
    }

}