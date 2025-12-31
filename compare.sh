#!/bin/bash

echo "Remote version: $REMOTEVERSION"
echo "Local version:  $LOCALVERSION"

if [ -z "$LOCALVERSION" ]; then
  echo "LOCALVERSION is empty, treating as not synced."
  echo "SYNCED=0" >> $GITHUB_ENV
  exit 0
fi

if [ "$REMOTEVERSION" = "$LOCALVERSION" ]; then
  echo "Versions are synced."
  echo "SYNCED=1" >> $GITHUB_ENV
else
  echo "Versions differ. Need to trigger build."
  echo "SYNCED=0" >> $GITHUB_ENV
fi