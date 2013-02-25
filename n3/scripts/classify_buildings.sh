#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 pseudoentities/*.n3 --query classification/buildings.n3 > content/buildingtopics.ttl
