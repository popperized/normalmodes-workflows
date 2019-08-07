#!/usr/bin/env bash
set -e

if [ -z "$NM_P_ORDER" ]; then
  echo "No NM_P_ORDER variable defined"
  exit 1
fi
if [ -z "$NM_JOB" ]; then
  echo "No NM_JOB variable defined"
  exit 1
fi
if [ -z "$NM_PLANETARY_MODEL" ]; then
  echo "No NM_PLANETARY_MODEL variable defined"
  exit 1
fi

case "$NM_PLANETARY_MODEL" in
"CONST3k")
    export BASE_NAME="CONST_1L_3k.1"
    ;;
"PREM3k")
    export BASE_NAME="prem_3L_3k.1"
    ;;
"Mtopo100k")
    export BASE_NAME="Mtopo_6L_100k.1"
    ;;
"RTMDWAK8k")
    export BASE_NAME="RTMDWAK_3L_8k.1"
    ;;
*)
    echo "Invalid NM_PLANETARY_MODEL Name.";exit 1
    ;;
esac

export INPUT_DIR="$GITHUB_WORKSPACE/submodules/NormalModes/demos/models/input/$NM_PLANETARY_MODEL/"
export OUTPUT_DIR="$GITHUB_WORKSPACE/submodules/NormalModes/demos/models/output/$NM_PLANETARY_MODEL/"



