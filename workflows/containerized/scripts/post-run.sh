#!/usr/bin/env bash

mkdir -p submodules/NormalModes/demos/models/output/CONST3k/vtk
chmod -R 0755 submodules/NormalModes/demos/models/output/CONST3k/vtk
octave ./workflows/containerized/scripts/matlab/visualCmain.m