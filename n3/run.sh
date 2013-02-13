#!/bin/bash

/opt/euler/eye --yap --nope ArchitectureOntology.ttl /opt/euler/rdfs-subClassOf.n3 --pass 
rapper -r -i turtle -o turtle - 'http://qldarch.net/ns/rdf/2012/06/terms#' > ArchitectureOntologyInferredFixed.ttl
