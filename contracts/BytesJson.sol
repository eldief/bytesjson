// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/utils/Strings.sol";

///@author eldief
///@notice Library for easly formatting bytes to json compatible format.
library BytesJson {

    /**
     * @notice Convert bytes to string.
     * @dev data should be json already json formatted.
     * @param _data bytes to be converted
     * @return string 
     */
    function toJson(bytes calldata _data) external pure returns (string memory) {
        return string(_data);
    }

    /**
     * @notice create new bytes object to work on.
     * @return bytes empty bytes
     */
    function init() external pure returns (bytes memory) {
        return new bytes(0);
    }

    /**
     * @notice format null type.
     * @return bytes null
     */
    function nullType() external pure returns (bytes memory) {
        return abi.encodePacked('null');
    }

    /**
     * @notice format true type.
     * @return bytes true
     */
    function trueType() external pure returns (bytes memory) {
        return abi.encodePacked('true');
    }

    /**
     * @notice format false type.
     * @return bytes false
     */
    function falseType() external pure returns (bytes memory) {
        return abi.encodePacked('false');
    }

    /**
     * @notice format string type.
     * @param _str string to be formatted
     * @return bytes formatted string
     */
    function stringType(string calldata _str) external pure returns (bytes memory) {
        return abi.encodePacked('"', _str, '"');
    }

    /**
     * @notice format uint256 type.
     * @param _uint uint256 to be formatted
     * @return bytes formatted uint256
     */
    function uintType(uint256 _uint) external pure returns (bytes memory) {
        return abi.encodePacked(Strings.toString(_uint));
    }

    /**
     * @notice format bytes32 type.
     * @param _bytes32 bytes32 to be formatted
     * @return bytes formatted bytes32
     */
    function bytes32Type(bytes32 _bytes32) external pure returns (bytes memory) {
        return abi.encodePacked('"', Strings.toHexString(uint256(_bytes32), 32), '"');
    }

    /**
     * @notice format address type.
     * @param _address address to be formatted
     * @return bytes formatted address
     */
    function addressType(address _address) external pure returns (bytes memory) {
        return abi.encodePacked('"', Strings.toHexString(uint256(uint160(_address)), 20), '"');
    }

    /**
     * @notice format uint256 array type.
     * @param _uints uint256 array to be formatted
     * @return bytes formatted uint256 array
     */
    function uintArrayType(uint256[] calldata _uints) external pure returns (bytes memory) {
        bytes memory _bytes = abi.encodePacked('[');
        for (uint i = 0; i < _uints.length;) {
            _bytes = i == _uints.length - 1
                ? abi.encodePacked(_bytes, Strings.toString(_uints[i]))
                : abi.encodePacked(_bytes, Strings.toString(_uints[i]), ',');
            unchecked {
                ++i;
            }
        }
        return abi.encodePacked(_bytes, ']');
    }

    /**
     * @notice format string array type.
     * @param _strs string array to be formatted
     * @return bytes formatted string array
     */
    function stringArrayType(string[] calldata _strs) external pure returns (bytes memory) {
        bytes memory _bytes = abi.encodePacked('[');
        for (uint i = 0; i < _strs.length;) {
            _bytes = i == _strs.length - 1
                ? abi.encodePacked(_bytes, '"', _strs[i], '"')
                : abi.encodePacked(_bytes, '"', _strs[i], '",');
            unchecked {
                ++i;
            }
        }
        return abi.encodePacked(_bytes, ']');
    }

    /**
     * @notice add a comma.
     * @param _data bytes to append comma on
     * @return bytes bytes with appended comma
     */
    function comma(bytes calldata _data) external pure returns (bytes memory) {
        return abi.encodePacked(_data, ',');
    }

    /**
     * @notice append and format _name and _value as a json property.
     * @param _data bytes to append property on
     * @param _name property name
     * @param _value property value
     * @return bytes bytes with appended property
     */
    function prop(bytes calldata _data, bytes calldata _name, bytes calldata _value) external pure returns (bytes memory) {
        return abi.encodePacked(_data, _name, ':', _value);
    }

    /**
     * @notice append and incapsulate data into array brackets.
     * @param _data bytes to append array on
     * @param _props bytes property to incapsulate
     * @return bytes bytes with appended array
     */
    function array(bytes calldata _data, bytes calldata _props) external pure returns (bytes memory) {
        return abi.encodePacked(_data, '[', _props, ']');
    }

    /**
     * @notice append and incapsulate data into object brackets.
     * @param _data bytes to append object on
     * @param _props bytes property to incapsulate
     * @return bytes bytes with appended object
     */
    function object(bytes calldata _data, bytes calldata _props) external pure returns (bytes memory) {
        return abi.encodePacked(_data, '{', _props, '}' );
    }
}