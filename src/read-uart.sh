#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri (danascape)
#
# SPDX-License-Identifier: Apache-2.0 license
#

if [[ -z "$(which picocom)" ]]; then
    echo "error: Install picocom package!"
fi

sudo picocom -b 9600 /dev/ttyACM1 | tee /home/saalim/AutomatedFarm-infra/logs.txt
