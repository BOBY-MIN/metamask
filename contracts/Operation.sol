// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Operation {

    uint public intData = 0;
    string public stringData;

    function math() public {

        intData = intData + 1;
        intData += 1;
        intData++;

        intData = intData - 1;
        intData = intData * 1;
        intData = intData / 1;
    }

    function weiToEth() public {

        // ethereum 에서 가장 작은 화폐 단위
        uint wei_data = 1 wei;

        uint eth_data = wei_data * (10**18);
        // 1000000000000000000
        // 1000000000000000000 / (10**18) = 1ETH
        // 1eth 가 아닌 1000000000000000000 값으로 프론트에 전달해주는 것이 코딩컨벤션임.

        uint gwei_data = wei_data * (10**9);

    }

    function logical() public {
        bool true_data = true;
        bool false_data = false;


    }


}