#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 static/typologyicons.ttl reconciled/*.ttl --query classification/typologies.n3 > resources/typedbuildings.ttl
