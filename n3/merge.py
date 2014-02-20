#!/usr/bin/python
import json
import re
from pprint import pprint
from sys import argv,exit
if len(argv) == 4:
    filename = argv[1]
    filename2 = argv[2]
    type = argv[3]
else:
    print "Usage: merge.py <filename.ttl> <filename.n3> <type>"
    exit(1)
json_data=open(filename2, 'r')
firstNameKey = 'http://xmlns.com/foaf/0.1/firstName'
lastNameKey = 'http://xmlns.com/foaf/0.1/lastName'
labelKey = 'http://qldarch.net/ns/rdf/2012-06/terms#label'
firmNameKey = 'http://qldarch.net/ns/rdf/2012-06/terms#firmName'
data = json.load(json_data)
entries = []
    
index = 1
for d in data:
  if str(data[d]['uri']).startswith( 'http://qldarch.net/rdf/2012-12/resources' ):
    entry = {'uri': data[d]['uri'][data[d]['uri'].rfind('/') + 1:]}
    if labelKey in data[d]:
      entry['label'] = str(data[d][labelKey])
    if firstNameKey in data[d]:
      entry['firstName'] = str(data[d][firstNameKey])
    if lastNameKey in data[d]:
      entry['lastName'] = str(data[d][lastNameKey])
    if firmNameKey in data[d]:
      entry['firmName'] = str(data[d][firmNameKey])
    
    if int(entry['uri']) >= index:
      index = int(entry['uri']) + 1
    entries.append(entry)
triplepattern = re.compile("^<")
replacepattern = re.compile("REPLACEME")
replacepattern = re.compile("REPLACEME")
with open(filename, 'r') as f:
  for line in f:
    if triplepattern.match(line) :
      exit = 0
      label = line[line.rfind('qldarch:label') + 13:]
      label = label[label.find('"') + 1:]
      label = label[:label.find('"')]
      for e in entries:
        if e['label'] == label:
          exit = 1
          break
      if exit == 0 :
        entry = {'uri': str(index), 'label': label}
        if 'foaf:firstName' in line:
          entry['firstName'] = line[line.rfind('foaf:firstName') + 14:]
          entry['firstName'] = entry['firstName'][entry['firstName'].find('"') + 1:]
          entry['firstName'] = entry['firstName'][:entry['firstName'].find('"')]
        if 'foaf:lastName' in line:
          entry['lastName'] = line[line.rfind('foaf:lastName') + 14:]
          entry['lastName'] = entry['lastName'][entry['lastName'].find('"') + 1:]
          entry['lastName'] = entry['lastName'][:entry['lastName'].find('"')]
        if 'qldarch:firmName' in line:
          entry['firmName'] = line[line.rfind('qldarch:firmName') + 17:]
          entry['firmName'] = entry['firmName'][entry['firmName'].find('"') + 1:]
          entry['firmName'] = entry['firmName'][:entry['firmName'].find('"')]
        index += 1
        entries.append(entry) 
    else:
      print line;
      
for entry in entries:
  outputStr = '<' + entry['uri'] + '> a ' + type + ' ;'
  if 'firmName' in entry:
    outputStr = outputStr + ' qldarch:firmName "' + entry['firmName'] + '" ;'
  if 'firstName' in entry:
    outputStr = outputStr + ' foaf:firstName "' + entry['firstName'] + '" ;'
  if 'lastName' in entry:
    outputStr = outputStr + ' foaf:lastName "' + entry['lastName'] + '" ;'
  outputStr = outputStr + ' qldarch:label "' + entry['label'] + '" .'
  print outputStr
