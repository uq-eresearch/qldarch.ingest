#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl entities/*.ttl omekaexport/latest.ttl resources/*.ttl classification/*.n3 pseudoentities/*.n3 --query inference/infer_latlong.n3 > resources/latlong.ttl
