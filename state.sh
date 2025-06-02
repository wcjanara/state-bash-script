#!/bin/bash

# state.sh - Logging system state into /tmp/state.log

{
  echo  "===== $(date) ====="
  echo "Current Load and Users:"
  W
  echo "Running Processes (with PID and PPID):"
  ps -ef --columns=200
  echo ""
  } >> /tmp/state.log
