#!/bin/bash

#
# This should be replaced with a make script.
#

for script in `ls ./scripts/extract*.sh`; do
    $(echo $script)
done
