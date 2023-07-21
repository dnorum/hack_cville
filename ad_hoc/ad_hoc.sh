#!/bin/bash

# Run an ad-hoc query
sudo -u postgres psql $1 -f $2.sql
