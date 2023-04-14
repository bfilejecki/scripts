#!/bin/bash

which parallel > /dev/null 2>&1 || { echo "GNU Parallel not found on PATH, script will exit"; exit 1; }
which git > /dev/null 2>&1 || { echo "git not found on PATH, script will exit"; exit 1; }

DIRECTORY=${1:?"Missing directory argument"}

find "$DIRECTORY" -type d -name ".git" | parallel git --git-dir={} --work-tree={//} remote get-url origin
