// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {BytesJson} from "./BytesJson.sol";

contract BytesJsonUser {
    using BytesJson for *;
    
    function init() public pure returns (string memory) {
        return BytesJson.init().toJson();
    }

    function nullType() public pure returns (string memory) {
        return BytesJson.nullType().toJson();
    }
    
    function trueType() public pure returns (string memory) {
        return BytesJson.trueType().toJson();
    }
    
    function falseType() public pure returns (string memory) {
        return BytesJson.falseType().toJson();
    }
    
    function stringType() public pure returns (string memory) {
        return "string".stringType().toJson();
    }

    function uintType() public pure returns (string memory) {
        return 1.uintType().toJson();
    }

    function bytes32Type() public pure returns (string memory) {
        bytes32 _b = bytes32(0);
        return _b.bytes32Type().toJson();
    }

    function addressType() public pure returns (string memory) {
        address _add = address(0);
        return _add.addressType().toJson();
    }

    function uintArrayType() public pure returns (string memory) {
        uint[] memory _arr = new uint[](2);
        _arr[0]= 0;
        _arr[1]= 1;
        return _arr.uintArrayType().toJson();
    }

    function stringArrayType() public pure returns (string memory) {
        string[] memory _arr = new string[](2);
        _arr[0]= '0';
        _arr[1]= '1';
        return _arr.stringArrayType().toJson();
    }

    function prop() public pure returns (string memory) {
        return BytesJson.init()
            .prop(
                "key".stringType(),
                "value".stringType()
            ).toJson();
    }

    function array() public pure returns (string memory) {
        return BytesJson.init()
            .array(
                "0,1"
            ).toJson();
    }

    function object() public pure returns (string memory) {
        return BytesJson.init()
            .object(BytesJson.init()
                .prop(
                    "key".stringType(),
                    "value".stringType()
                )
            ).toJson();
    }

    function objectConcatenation() public pure returns (string memory) {
        return BytesJson.init()
            .object(BytesJson.init()
                .prop(
                    "key".stringType(),
                    1.uintType()
                )
            ).comma()
            .object(BytesJson.init()
                .prop(
                    "key".stringType(),
                    "value".stringType()
                )
            ).toJson();
    }
}