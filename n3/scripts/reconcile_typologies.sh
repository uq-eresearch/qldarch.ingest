#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 static/typologyicons.ttl pseudoentities/*.n3 --query pseudoentities/typologies.n3 > reconciled/typedbuildings.ttl
