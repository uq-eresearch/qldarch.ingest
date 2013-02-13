#!/bin/bash

cat latest-export.ttl | rapper -r -i turtle -o turtle - 'http://qldarch.net/omeka/items/show/' > latest-export-clean.ttl
