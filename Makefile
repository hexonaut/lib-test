all    :; DAPP_STANDARD_JSON="config.json" dapp build
clean  :; dapp clean
test   :; dapp test
deploy :; ./test.sh
