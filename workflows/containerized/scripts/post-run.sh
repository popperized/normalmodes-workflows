#!/usr/bin/env bash
set -e
if [ -z "$NM_NPROC" ]; then
  echo "No NM_NPROC variable defined"
  exit 1
fi
if [ -z "$NM_NTH" ]; then
  echo "No NM_NTH variable defined"
  exit 1
fi
source ./workflows/containerized/scripts/set-env.sh

mkdir -p "$OUTPUT_DIR"vtk

chmod -R 0755 "$OUTPUT_DIR"vtk

octave ./workflows/containerized/scripts/matlab/visualCmain.m
mkdir -p ./workflows/containerized/$NM_PLANETARY_MODEL/vtk/
mv "$OUTPUT_DIR"vtk ./workflows/containerized/$NM_PLANETARY_MODEL/