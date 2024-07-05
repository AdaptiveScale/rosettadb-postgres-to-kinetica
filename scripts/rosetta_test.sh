#! /bin/bash

# author: AdaptiveScale Inc.
#    
#
echo "#####################"
echo "#                   #"
echo "#  Starting Script  #"
echo "#                   #"
echo "#####################"

export ROSETTA_DRIVERS=/home/runner/work/rosetta-ci-cd/rosetta-ci-cd/drivers/*
export PATH=$PATH:/home/runner/work/rosettadb-postgres-to-kinetica/rosettadb-postgres-to-kinetica/rosetta/bin/
export PATH=$PATH:/home/runner/work/rosettadb-postgres-to-kinetica/rosettadb-postgres-to-kinetica/kinetica/

echo "[DEBUG] ROSETTA_DRIVERS = $ROSETTA_DRIVERS"
echo "[DEBUG] PATH=$PATH"

echo "[DEBUG] Show rosetta version"
rosetta --version

echo "[DEBUG] Run rosetta tests"
rosetta test -s kinetica-cloud

