#!/usr/bin/env bash

echo "Running pre-commit hook"
./scripts/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before commiting"
 exit 1
fi


./scripts/run-tests.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "All tests must pass before commiting"
 exit 1
fi



