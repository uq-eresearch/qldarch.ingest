export D2RQ_HOME=/var/qldarch/qldarch.ingest/bin/d2rq
mysql -h 127.0.0.1 -P 3306 -u omeka omeka --password=qld4rch! < /var/qldarch/qldarch.ingest/d2rq/default-portrait-types.sql
cat /var/qldarch/qldarch.ingest/d2rq/omeka-mapping.ttl /var/qldarch/qldarch.ingest/d2rq/mysql.password > /var/qldarch/qldarch.ingest/omeka-mapping-with-password.ttl
/var/qldarch/qldarch.ingest/bin/d2rq/dump-rdf -f TURTLE -o /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/omeka-mapping-with-password.ttl
rm /var/qldarch/qldarch.ingest/n3/reconciled/*.ttl
rm /var/qldarch/qldarch.ingest/n3/content/*.ttl
rm /var/qldarch/qldarch.ingest/n3/resources/*.ttl
rm /var/qldarch/qldarch.ingest/n3/entities/*.ttl
rm /var/qldarch/qldarch.ingest/n3/entities/raw/*.ttl
rm /var/qldarch/qldarch.ingest/n3/entities/raw/*.n3
rm /var/qldarch/qldarch.ingest/n3/relatedto/*.ttl
/opt/euler/eye --yap --nope --strings /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/extractentities/buildings.n3 --pass > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-buildings.ttl
/opt/euler/eye --yap --nope --strings /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/extractentities/firms.n3 --pass > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-firms.ttl
/opt/euler/eye --yap --nope --strings /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/extractentities/people.n3 --pass > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-people.ttl
/opt/euler/eye --yap --nope --strings /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/extractentities/typologies.n3 --pass > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-typologies.ttl
curl "http://qldarch-test.metadata.net/ws/rest/entity/summary/qldarch:Structure" > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-buildings.n3
curl "http://qldarch-test.metadata.net/ws/rest/entity/summary/qldarch:Firm" > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-firms.n3
curl "http://qldarch-test.metadata.net/ws/rest/entity/summary/foaf:Person" > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-people.n3
curl "http://qldarch-test.metadata.net/ws/rest/entity/summary/qldarch:BuildingTypology" > /var/qldarch/qldarch.ingest/n3/entities/raw/raw-typologies.n3
/var/qldarch/qldarch.ingest/n3/merge.py /var/qldarch/qldarch.ingest/n3/entities/raw/raw-buildings.ttl /var/qldarch/qldarch.ingest/n3/entities/raw/raw-buildings.n3 qldarch:Structure > /var/qldarch/qldarch.ingest/n3/entities/buildings.ttl
/var/qldarch/qldarch.ingest/n3/merge.py /var/qldarch/qldarch.ingest/n3/entities/raw/raw-firms.ttl /var/qldarch/qldarch.ingest/n3/entities/raw/raw-firms.n3 qldarch:Firm > /var/qldarch/qldarch.ingest/n3/entities/firms.ttl
/var/qldarch/qldarch.ingest/n3/merge.py /var/qldarch/qldarch.ingest/n3/entities/raw/raw-people.ttl /var/qldarch/qldarch.ingest/n3/entities/raw/raw-people.n3 foaf:Person > /var/qldarch/qldarch.ingest/n3/entities/people.ttl
/var/qldarch/qldarch.ingest/n3/merge.py /var/qldarch/qldarch.ingest/n3/entities/raw/raw-typologies.ttl /var/qldarch/qldarch.ingest/n3/entities/raw/raw-typologies.n3 qldarch:BuildingTypology > /var/qldarch/qldarch.ingest/n3/entities/typologies.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/entities/*.ttl /var/qldarch/qldarch.ingest/n3/manual/*.ttl --query /var/qldarch/qldarch.ingest/n3/classification/expand-entities-query.n3 > /var/qldarch/qldarch.ingest/n3/resources/entities.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/AuxilaryArchitectureOntology.ttl /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/*.ttl /var/qldarch/qldarch.ingest/n3/manual/*.ttl --query /var/qldarch/qldarch.ingest/n3/classification/expand_hasTranscript.n3 > /var/qldarch/qldarch.ingest/n3/content/hasTranscript.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/pseudoentities/buildings.n3 > /var/qldarch/qldarch.ingest/n3/reconciled/buildingtopics.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/pseudoentities/firms.n3 > /var/qldarch/qldarch.ingest/n3/reconciled/firms.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/pseudoentities/people.n3 > /var/qldarch/qldarch.ingest/n3/reconciled/peopledproperties.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/static/typologyicons.ttl /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/pseudoentities/typologies.n3 > /var/qldarch/qldarch.ingest/n3/reconciled/typedbuildings.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/classification/architects.n3 > /var/qldarch/qldarch.ingest/n3/resources/architects.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/static/typologyicons.ttl /var/qldarch/qldarch.ingest/n3/reconciled/*.ttl --query /var/qldarch/qldarch.ingest/n3/classification/typologies.n3 > /var/qldarch/qldarch.ingest/n3/resources/typedbuildings.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/classification/buildings.n3 > /var/qldarch/qldarch.ingest/n3/content/buildingtopics.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/classification/people.n3 > /var/qldarch/qldarch.ingest/n3/content/peopledproperties.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/associatedFirm.n3 > /var/qldarch/qldarch.ingest/n3/content/associatedFirms.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/content/*.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/infer_building_firm.n3 > /var/qldarch/qldarch.ingest/n3/resources/buildingFirm.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/content/*.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/infer_building_location.n3 > /var/qldarch/qldarch.ingest/n3/resources/buildingLocation.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/entities/*.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/infer_latlong.n3 > /var/qldarch/qldarch.ingest/n3/resources/latlong.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/entities/*.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/preferredImage.n3 > /var/qldarch/qldarch.ingest/n3/resources/preferredImages.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 /var/qldarch/qldarch.ingest/n3/inference/*.n3 --query /var/qldarch/qldarch.ingest/n3/inference/relatedTo.n3 > /var/qldarch/qldarch.ingest/n3/relatedto/relatedTo.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/AuxilaryArchitectureOntology.ttl /var/qldarch/qldarch.ingest/owl/UpperArchitectureOntology.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/manual/*.ttl --query /var/qldarch/qldarch.ingest/n3/inference/clean_content.n3 > /var/qldarch/qldarch.ingest/n3/content/cleanlatest.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 /var/qldarch/qldarch.ingest/n3/inference/preferredImage.n3 /var/qldarch/qldarch.ingest/n3/inference/relatedTo.n3 --query /var/qldarch/qldarch.ingest/n3/inference/relatedTo-content-query.n3 /var/qldarch/qldarch.ingest/n3/content/*.ttl > /var/qldarch/qldarch.ingest/n3/content/relatedTo.ttl
/opt/euler/eye --yap --nope /var/qldarch/qldarch.ingest/n3/rules/*.n3 /var/qldarch/qldarch.ingest/owl/inferred/ArchitectureOntologyInferred.ttl /var/qldarch/qldarch.ingest/n3/omekaexport/latest.ttl /var/qldarch/qldarch.ingest/n3/resources/*.ttl /var/qldarch/qldarch.ingest/n3/classification/*.n3 /var/qldarch/qldarch.ingest/n3/pseudoentities/*.n3 /var/qldarch/qldarch.ingest/n3/inference/preferredImage.n3 /var/qldarch/qldarch.ingest/n3/inference/relatedTo.n3 --query /var/qldarch/qldarch.ingest/n3/inference/relatedTo-resources-query.n3 /var/qldarch/qldarch.ingest/n3/content/*.ttl > /var/qldarch/qldarch.ingest/n3/resources/relatedTo.ttl
tar -czvf /var/qldarch/qldarch.ingest/n3/old-load.tgz /var/qldarch/qldarch.ingest/n3/load/
rm /var/qldarch/qldarch.ingest/n3/load/*.ttl
cat /var/qldarch/qldarch.ingest/n3/content/*.ttl > /var/qldarch/qldarch.ingest/n3/load/omekaexport.ttl
cat /var/qldarch/qldarch.ingest/n3/resources/*.ttl > /var/qldarch/qldarch.ingest/n3/load/resources.ttl
curl -d "context=%3Chttp%3A%2F%2Fqldarch.net%2Fns%2Fomeka-export%2F2013-02-06%3E" http://localhost:8080/openrdf-workbench/repositories/QldarchMetadataServer/clear
curl -d "context=%3Chttp%3A%2F%2Fqldarch.net%2Frdf%2F2012%2F12%2Fresources%23%3E" http://localhost:8080/openrdf-workbench/repositories/QldarchMetadataServer/clear
cp /var/qldarch/qldarch.ingest/n3/load/omekaexport.ttl /var/www/html/static/omekaexport.ttl
cp /var/qldarch/qldarch.ingest/n3/load/resources.ttl /var/www/html/static/resources.ttl
curl --verbose --data-urlencode Content-Type=autodetect --data-urlencode baseURI=http://qldarch.net/ns/omeka-export/2013-02-06 --data-urlencode useForContext=on --data-urlencode context="<http://qldarch.net/ns/omeka-export/2013-02-06>" --data-urlencode source=url --data-urlencode url=http://qldarch-test.metadata.net/static/omekaexport.ttl http://localhost:8080/openrdf-workbench/repositories/QldarchMetadataServer/add
curl --verbose --data-urlencode Content-Type=autodetect --data-urlencode baseURI=http://qldarch.net/rdf/2012/12/resources# --data-urlencode useForContext=on --data-urlencode context="<http://qldarch.net/rdf/2012/12/resources#>" --data-urlencode source=url --data-urlencode url=http://qldarch-test.metadata.net/static/resources.ttl http://localhost:8080/openrdf-workbench/repositories/QldarchMetadataServer/add
rm /var/www/html/static/omekaexport.ttl
rm /var/www/html/static/resources.ttl
java -jar /var/qldarch/qldarch.solr/dist/qldarch-ingest.jar --outputdir=/var/qldarch/output --stages=article:transcript:deploy:describe:solringest
