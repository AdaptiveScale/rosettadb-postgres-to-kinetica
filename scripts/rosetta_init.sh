#! /bin/bash
#
# AdaptiveScale Inc.
#    
#
echo "#####################"
echo "#                   #"
echo "#  Starting Script  #"
echo "#                   #"
echo "#####################"

export OPENAI_API_KEY=$OPENAI_API_KEY

export ROSETTA_DRIVERS=/home/runner/work/rosettadb-postgres-to-kinetica/rosettadb-postgres-to-kinetica/drivers/*
export PATH=$PATH:/home/runner/work/rosettadb-postgres-to-kinetica/rosettadb-postgres-to-kinetica/rosetta/bin/
export PATH=$PATH:/home/runner/work/rosettadb-postgres-to-kinetica/rosettadb-postgres-to-kinetica/kinetica/

echo "[DEBUG] ROSETTA_DRIVERS=$ROSETTA_DRIVERS"
echo "[DEBUG] PATH=$PATH"

echo "[DEBUG] Show rosetta version"
rosetta --version
