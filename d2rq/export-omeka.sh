#!/bin/sh

${D2RQ_HOME}/dump_rdf -f TURTLE -o current-export.ttl -p $(cat mysql.password) omeka-mapping.ttl
