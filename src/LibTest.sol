pragma solidity ^0.6.7;

library TestLibrary {

    function setLibTestValueInternal(address libTest, uint256 newValue) internal {
        return LibTest(libTest).setValue(newValue);
    }

    function setLibTestValueExternal(address libTest, uint256 newValue) external {
        return LibTest(libTest).setValue(newValue);
    }

}

contract LibTest {

    uint256 public value;

    function setValue(uint256 newValue) external {
        value = newValue;
    }

}

contract TestCaller {

    using TestLibrary for *;

    function setLibTestInternal(address libTest, uint256 newValue) external {
        return libTest.setLibTestValueInternal(newValue);
    }

    function setLibTestExternal(address libTest, uint256 newValue) external {
        return libTest.setLibTestValueExternal(newValue);
    }

}
