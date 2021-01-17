# LibTest

A proof of concept for initiating remote, state-changing calls inside an external library.

## Install

This needs a bug-fixed version of dapp tools to get the config.json loaded properly:

    nix-env -iA dapp -f https://github.com/dapphub/dapptools/archive/dappdispatcher.tar.gz

## Run

Ensure environment is set up for Kovan and run:

    ./test.sh