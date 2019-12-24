#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)
SCRIPT_DIR="../../scripts"

echo "Installing hooks..."
# below commands will symlink our pre-(commit, push) scripts to git
#ln -s "${SCRIPT_DIR}/pre-commit.bash $GIT_DIR/hooks/pre-commit
#ln -s "${SCRIPT_DIR}/pre-push.bash $GIT_DIR/hooks/pre-push
ln -s ../../scripts/pre-commit.bash $GIT_DIR/hooks/pre-commit
ln -s ../../scripts/pre-push.bash $GIT_DIR/hooks/pre-push

echo "Hooks installed successfully"

