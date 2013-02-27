#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 pseudoentities/*.n3 inference/preferredImage.n3 inference/relatedTo.n3 --query inference/relatedTo-content-query.n3 content/*.ttl > content/relatedTo.ttl

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 pseudoentities/*.n3 inference/preferredImage.n3 inference/relatedTo.n3 --query inference/relatedTo-resources-query.n3 content/*.ttl > resources/relatedTo.ttl
