#!/usr/bin/env bash

echo "Running pre-push hook"
./scripts/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before pushing to remote"
 exit 1
fi


./scripts/run-tests.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "All tests must pass before pushing to remote"
 exit 1
fi



