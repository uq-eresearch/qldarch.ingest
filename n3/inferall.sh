#!/bin/bash

#
# This should be replaced with a make script.
#

rm reconciled/*.ttl
rm content/*.ttl
rm resources/*.ttl

for script in `ls ./scripts/reconcile*.sh`; do
    $(echo $script)
done

for script in `ls ./scripts/classify*.sh`; do
    $(echo $script)
done

for script in `ls ./scripts/infer*.sh`; do
    $(echo $script)
done

for script in `ls ./scripts/clean*.sh`; do
    $(echo $script)
done

