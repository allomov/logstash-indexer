#!/bin/bash

#set -eux # -x for verbose logging to juju debug-log

# Set CONFIG constants
VERSION="1.4.2"
BASEURL="https://download.elasticsearch.org/logstash/logstash"
# CHECKSUM="863272192b52bccf1fc2cf839a888eaf"
WORKDIR="/opt"
BASEPATH="/opt/logstash"
USER="logstash"
HOST=`unit-get private-address`
CLUSTER_NAME="elasticsearch"
RABBIT_USER="logstash"
RABBIT_VHOST="logstash"

# Grab CONFIG variables
# Example :
#     USER=$(config-get user)
#     juju-log "Logstash User: ${USER}"

juju-log "Finished loading config variables"