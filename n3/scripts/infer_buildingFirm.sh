#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/latest.ttl content/*.ttl resources/*.ttl classification/*.n3 pseudoentities/*.n3 --query inference/infer_building_firm.n3 > resources/buildingFirm.ttl
