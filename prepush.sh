#!/bin/bash
# Warn before pushing to protected branches
# Bypass with git push --no-verify

BRANCH=`git rev-parse --abbrev-ref HEAD`
PROTECTED_BRANCHES="^(master|push_warning|release-*)"

echo "Push aborted."
if [[ "$BRANCH" =~ $PROTECTED_BRANCHES ]]; then
  read -p "Are you sure you want to push to \"$BRANCH\" ? (y/n): " -n 1 -r < /dev/tty
  echo
  if ![[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Push aborted."
    exit 1
  fi
fi
exit 0
