#!/bin/bash

# Test on kovan

# Build everything
# Deployed library exists at 0x86214f65c5A3B9200a89bBf354DBc5B98fFF6874 and is specified in the config.json
DAPP_STANDARD_JSON="config.json" dapp build

# Deploy the target contract
echo "Deploying LibTest..."
LIB_TEST=$(dapp create LibTest)

if [ `seth call $LIB_TEST 'value()(uint256)'` -ne 0 ]
then
    echo "Failure on LIB_TEST deploy."
    exit
fi

# Directly set the value
echo "Testing direct set..."
seth send $LIB_TEST 'setValue(uint256)' 123

if [ `seth call $LIB_TEST 'value()(uint256)'` -ne 123 ]
then
    echo "Failure on direct set."
    exit
fi

# Deploy the SpellAction analogue
echo "Deploying TestCaller..."
TEST_CALLER=$(dapp create TestCaller)

# Indirectly set the value with an embedded library call
echo "Testing indirect, embedded set..."
seth send $TEST_CALLER 'setLibTestInternal(address,uint256)' $LIB_TEST 456

if [ `seth call $LIB_TEST 'value()(uint256)'` -ne 456 ]
then
    echo "Failure on indirect, embedded set."
    exit
fi

# Indirectly set the value with a dynamically linked library call
echo "Testing indirect, linked set..."
seth send $TEST_CALLER 'setLibTestExternal(address,uint256)' $LIB_TEST 789

if [ `seth call $LIB_TEST 'value()(uint256)'` -ne 789 ]
then
    echo "Failure on indirect, linked set."
    exit
fi

echo "All tests passed successfully!"
