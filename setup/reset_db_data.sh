#!/usr/bin/env bash
# Sandfly Security LTD www.sandflysecurity.com
# Copyright (c) 2016-2018 Sandfly Security LTD, All Rights Reserved.

# This will delete all the results, errors, and audit log data from the Sandfly server. This is useful if
# the system got flooded with alarms or other data and you want to quickly get rid of all of it and start fresh.
# All other config data will remain untouched.

WORKING_DIR=$PWD

# Uncomment and change this if you wish to override what elastic DB for Sandfly so to use. The default is to use
# sandfly container version, but you can use your own cluster if you wish.
#export ELASTIC_SERVER="ip_addr_or_hostname_here"

docker network create sandfly-net
docker rm sandfly-server-mgmt

docker run --name sandfly-server-mgmt \
--network sandfly-net \
-e ELASTIC_SERVER \
-it sandfly/sandfly-server-mgmt:latest /usr/local/sandfly/utils/init_data_db.sh



