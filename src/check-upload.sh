#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri (danascape)
#
# SPDX-License-Identifier: Apache-2.0 license
#

export HOME="/home/suraj"
WORK_DIR="/home/suraj/AutomatedFarm-infra/"
JSON_FILE="$WORK_DIR/json/plant.json"

git config --global --add safe.directory /home/suraj/AutomatedFarm-infra

# Get the Git status of the file
status=$(git status --porcelain "$JSON_FILE")

# Check if the file is updated
if [[ -n "$status" ]]; then
  # File is updated
  cd $WORK_DIR
  git config --local user.name "Saalim Quadri"
  git config --local user.email danascape@gmail.com
  git add json/plant.json
  git commit -m "[Automated]: Update plant json"
  git push
else
  # File is not updated
  echo "false"
fi
