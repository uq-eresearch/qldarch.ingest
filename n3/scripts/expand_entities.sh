#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl entities/*.ttl manual/*.ttl --query classification/expand-entities-query.n3 > resources/entities.ttl
