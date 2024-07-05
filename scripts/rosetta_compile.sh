#! /bin/bash
#
# AdaptiveScale Inc.
#    
#
source $(dirname "$0")/rosetta_init.sh

echo "[DEBUG] Extract and translate Postgres to Kinetica"
rosetta extract -s pg-neon -t kinetica-cloud
rosetta compile -s pg-neon -t kinetica-cloud

#Change schema name for Kinetica Cloud
sed -i "s/schema: \"$SOURCE_SCHEMA\"/schema: \"$TARGET_SCHEMA\"/g" kinetica-cloud/model.yaml