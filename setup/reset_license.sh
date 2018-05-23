#!/usr/bin/env bash
# Sandfly Security LTD www.sandflysecurity.com
# Copyright (c) 2016-2018 Sandfly Security LTD, All Rights Reserved.

# Used to reset an invalid or corrupted license key. Not normally needed unless directed to use by Sandfly
# support.

WORKING_DIR=$PWD

# Uncomment and change this if you wish to override what elastic DB for Sandfly so to use. The default is to use
# sandfly container version, but you can use your own cluster if you wish.
#export ELASTIC_SERVER="ip_addr_or_hostname_here"

docker network create sandfly-net
docker rm sandfly-server-mgmt


docker run --name sandfly-server-mgmt \
--network sandfly-net \
-e ELASTIC_SERVER \
-it sandfly/sandfly-server-mgmt:latest /usr/local/sandfly/utils/init_license_db.sh



