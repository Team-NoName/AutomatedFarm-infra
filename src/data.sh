#!/usr/bin/env bash

#
# Copyright (C) 2019 Saalim Quadri (danascape)
#
# SPDX-License-Identifier: Apache-2.0 license
#

WORK_DIR="/home/suraj/AutomatedFarm-infra"

LOGS_FILE="$WORK_DIR/logs.txt"

string=$(tail -n 1 $LOGS_FILE)

IFS='-' read HUMIDITY_DATA TEMPERATURE_DATA SOILMOISTURE_DATA PPM_DATA <<< "$string"

PLANT_DATA=Lettuce

# Generate json
genJSON() {
    GEN_JSON_BODY=$(jq --null-input \
                    --arg humidity "$HUMIDITY_DATA" \
                    --arg temperature "$TEMPERATURE_DATA" \
                    --arg soilmoisture "$SOILMOISTURE_DATA" \
                    --arg airquality "$PPM_DATA" \
                    --arg plant "$PLANT_DATA" \
                    "{"humidity": \"$HUMIDITY_DATA\", "temperature": \"$TEMPERATURE_DATA\", "soilmoisture": \"$SOILMOISTURE_DATA\", "airquality": \"$PPM_DATA\", "plant": \"$PLANT_DATA\"}")
    echo $GEN_JSON_BODY
    if [[ -f $WORK_DIR/json/plant.json ]]; then
        rm $WORK_DIR/json/plant.json
    fi
    echo "$GEN_JSON_BODY" >> $WORK_DIR/json/plant.json
}

genJSON
