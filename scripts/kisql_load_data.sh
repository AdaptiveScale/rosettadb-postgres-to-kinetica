#! /bin/bash
#
# AdaptiveScale Inc.
#    
#
source $(dirname "$0")/rosetta_init.sh

export KI_PWD=$KINETICA_PASSWORD
echo "[DEBUG] Loading data in Kinetica for the new tables using kisql"

cat kisql.sql

# Read more: https://docs.kinetica.com/7.1/tools/kisql/
kisql --url ${KINETICA_URL} \
      --isql \
      --showTime 0 \
      --format delim --delim ',' \
      --user $KINETICA_USER \
      --file kisql.sql