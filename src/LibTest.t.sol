pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./LibTest.sol";

contract LibTestTest is DSTest {
    LibTest test;

    function setUp() public {
        test = new LibTest();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
