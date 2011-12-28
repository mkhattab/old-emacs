#!/usr/bin/env bash

for d in `ls`; do
    pushd $d
    python setup.py install
    popd
done

