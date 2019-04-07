#!/bin/bash

set -euo pipefail

DOWNLOAD_URL=https://raw.githubusercontent.com/onmyway133/XcodeWay/master/XcodeWayExtensions/Script/XcodeWayScript.scpt
SCRIPT_DIR="${HOME}/Library/Application Scripts/com.onmyway133.XcodeWayApp.XcodeWayExtensions"

mkdir -p "${SCRIPT_DIR}"
curl $DOWNLOAD_URL -o "${SCRIPT_DIR}/XcodeWayScript.scpt"
