#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/*ArchitectureOntology.ttl omekaexport/latest.ttl entities/*.ttl classification/*.n3 pseudoentities/*.n3 inference/preferredImage.n3 inference/relatedTo.n3 --query inference/relatedTo.n3 > ont-output/relatedTo.ttl
