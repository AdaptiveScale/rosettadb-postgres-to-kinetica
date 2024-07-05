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

export BIGQUERY_JDBC_DRIVER=drivers/*
export OPENAI_API_KEY=$OPENAI_API_KEY

export ROSETTA_DRIVERS=/home/runner/work/rosetta-ci-cd/rosetta-ci-cd/drivers/*
export PATH=$PATH:/home/runner/work/rosetta-ci-cd/rosetta-ci-cd/rosetta/bin/
export PATH=$PATH:/home/runner/work/rosetta-ci-cd/rosetta-ci-cd/kinetica/

echo "[DEBUG] ROSETTA_DRIVERS=$ROSETTA_DRIVERS"
echo "[DEBUG] PATH=$PATH"

export GOOGLE_CREDS_PATH=/home/runner/work/rosetta-ci-cd/rosetta-ci-cd/service-account.json

echo "[DEBUG] Show rosetta version"
rosetta --version