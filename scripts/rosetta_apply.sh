#! /bin/bash
#
# AdaptiveScale Inc.
#    
#
source $(dirname "$0")/rosetta_init.sh

echo "[DEBUG] Checking diff and applying changes to Kinetica"
rosetta diff -s kinetica-cloud
rosetta diff -s kinetica-cloud | SOURCE_SCHEMA=$SOURCE_SCHEMA TARGET_SCHEMA=$TARGET_SCHEMA scripts/extract_tables.sh
rosetta apply -s kinetica-cloud