#!/bin/bash

# Experience indicates that some turtle parsers are intolerant of the output of d2rq due to misparsing numbers terminated with '.'.
# Passing the output of the omeka export through rapper produces 'generous' turtle that does not trigger these bugs.

cat latest-export.ttl | rapper -r -i turtle -o turtle - 'http://qldarch.net/omeka/items/show/' > latest-export-clean.ttl
