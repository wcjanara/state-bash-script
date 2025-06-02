#!/bin/bash

# Appending timestamp and ls -l of the current git repo to state.log

{
  echo  "===== $(date) ====="
  ls -l
  echo ""
 } >> state.log

# Git add/commmit

git add state.log
git commit -m "Auto-update state.log on $(date)"
git push origin main
