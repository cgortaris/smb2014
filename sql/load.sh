#!/bin/bash

# Create database from scratch: create.sql
sudo -u postgres psql < create.sql

# Load most of static data
psql --username=smb2014 smb2014 < static.sql

# Load players
psql --username=smb2014 smb2014 < players.sql

# Load fact tables
psql --username=smb2014 smb2014 < facts.sql

# Load stats tables
