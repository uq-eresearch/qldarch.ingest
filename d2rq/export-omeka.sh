#!/bin/bash

mysql -u omeka omeka < default-portrait-types.sql
cat omeka-mapping.ttl mysql.password > omeka-mapping-with-password.ttl
${D2RQ_HOME}/dump-rdf -f TURTLE -o latest-export.ttl omeka-mapping-with-password.ttl
