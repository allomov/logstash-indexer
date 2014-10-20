logstash-indexer-juju-charm
==============================

Juju Charm for standalone logstash server

will download the logastash monolithic.jar every time unless you have a copy in files/charm/

common.sh provides a bunch of config stuff bits ... useful to customize locations etc.

Inputs :
  File  -  /var/log/syslog and some others
  Redis -  configured to use redis as a message bus from logstash agents
Outputs :
  embedded - embedded elasticsearch ...  this is fine for starting off testing,  but should really use a real cluster
  elasticsearch - creation relationship with elasticsearch charm

disabled the web service ...   use kibana! (also joinable charm)

example 1 - Just the Indexer + Kibana
=====================================

    juju deploy --repository=logstash local:precise/logstash-indexer
    juju deploy --repository=logstash local:precise/kibana
    juju add-relation kibana logstash-indexer:rest
    juju expose kibana

http://ip-of-kibana

example 2 - Indexer + 2 x ElasticSearch + Kibana
============================================

    juju deploy --repository=logstash local:precise/elasticsearch
    juju add-unit elasticsearch
    juju deploy --repository=logstash local:precise/logstash-indexer
    juju add-relation logstash-indexer elasticsearch:cluster
    juju deploy --repository=logstash local:precise/kibana
    juju add-relation kibana elasticsearch:rest
    juju expose kibana

http://ip-of-kibana

example 3  - Agent + Indexer + 2 x ElasticSearch + Kibana
=============================================

    juju deploy --repository=logstash local:precise/elasticsearch
    juju add-unit elasticsearch
    juju deploy --repository=logstash local:precise/logstash-indexer
    juju add-relation elasticsearch:cluster logstash-indexer
    juju deploy --repository=logstash local:precise/kibana
    juju add-relation elasticsearch:rest kibana
    juju expose kibana
    juju deploy --repository=logstash local:precise/logstash-agent
    juju add-relation logstash-agent logstash-indexer:input

http://ip-of-kibana