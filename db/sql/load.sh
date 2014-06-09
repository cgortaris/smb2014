#!/bin/bash

# Load most of static data
psql -h fanaticodb.cjpoamapy2q6.us-west-1.rds.amazonaws.com -U apiuser fanaticoApi < static.sql

# Load players
psql -h fanaticodb.cjpoamapy2q6.us-west-1.rds.amazonaws.com -U apiuser fanaticoApi < players.sql

# Load fact tables
psql -h fanaticodb.cjpoamapy2q6.us-west-1.rds.amazonaws.com -U apiuser fanaticoApi < facts.sql

# Load stats tables
