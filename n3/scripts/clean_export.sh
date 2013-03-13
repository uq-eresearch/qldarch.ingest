#!/bin/bash

/opt/euler/eye --yap --nope ../owl/UpperArchitectureOntology.ttl rules/*.n3 omekaexport/latest.ttl manual/*.ttl --query inference/clean_content.n3 > content/cleanlatest.ttl
