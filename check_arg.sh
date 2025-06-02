#!/bin/bash

# check_arg.sh - Create a new script (check_arg.sh) which checks its options / arguments and prints out the result of this check. If the check fails then the usage message is also printed.

usage() {
  echo "Usage: $0 [ -i | -n ] USER [USER ...]"
  echo "  -i : interactive mode (default)"
  echo "  -n : non-interactive mode"
}

# Interactive mode
mode="interactive"
arg_index=1

if [[ "$1" == "-i" || "$1" == "-n" ]]; then
  if [[ "$1" == "-n" ]]; then
    mode="non-interactive"
  fi
  arg_index=2
fi

# Ensure no second mode is given
if [[ "$2" == "-i" || "$2" == "-n" ]]; then
  echo "Error: Only one of -i or -n can be specified"
  usage
  exit 1
fi

# Ensure at least one user given
if [[ "$#" -lt "$arg_index" ]]; then
  echo "Error: At least one USER is required"
  usage
  exit 1
fi

# Script prints out if it runs in interactive or in non-interactive mode. It also checks all user names and makes sure that every user name matches this regular expression: '^[a-z][a-z0-9_]*$'
echo "Running in $mode mode"

# Validate user names
regex='^[a-z][a-z0-9_]*$'
exit_code=0

for (( i=arg_index; i<=$#; i++ )); do
  user="${!i}"
  if [[ ! $user =~ $regex ]]; then
    echo "Invalid username: $user"
    exit_code=2
  fi
done

if [[ $exit_code -ne 0 ]]; then
  usage
  exit $exit_code
fi

exit 0
