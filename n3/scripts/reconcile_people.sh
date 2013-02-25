#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/*ArchitectureOntology.ttl omekaexport/latest.ttl entities/*.ttl classification/*.n3 pseudoentities/*.n3 --query pseudoentities/people.n3 > reconciled/peopledproperties.ttl
