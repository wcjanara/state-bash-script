#!/bin/bash

# movelog.sh - creating new script so that /tmp/state.log file is moved into file statelog.YYYYMMDD where YYYYMMDD is the current date and removes old statelog.YYYYMMDD files 2 weeks old or greater
# YYMMDD file has state info stored every 5 mins for whole day from midnight to next midnight
# Define where log files are stored in folder (where final log files are stored)
LOG_DIR="/tmp"

# Generate today's filename
TODAY=$(date +%Y%M%D)
ARCHIVE_FILE="$LOG_DIR/statelog.$TODAY"

# Move main log to daily archive
if [ -f /tmp/state.log ]; then
  mv /tmp/state.log "$ARCHIVE_FILE"
fi

# Deleting files older than 14 days
find "$LOG_DIR" -type f -name 'statelog.*' -mtime +13 -exec rm {} \;
