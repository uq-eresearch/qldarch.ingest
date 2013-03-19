#!/bin/bash

/opt/euler/eye --yap --nope rules/*.n3 ../owl/AuxilaryArchitectureOntology.ttl ../owl/inferred/ArchitectureOntologyInferred.ttl omekaexport/*.ttl manual/*.ttl --query classification/expand_hasTranscript.n3 > content/hasTranscript.ttl
