#!/bin/bash

/opt/euler/eye --yap --nope ../owl/UpperArchitectureOntology.ttl rules/*.n3 omekaexport/latest.ttl --query inference/cleanexport.n3 > content/cleanlatest.ttl
