#!/usr/bin/env bash
dir=${0%/*}; if [ "$dir" = "$0" ]; then dir="."; fi; cd "$dir";

echo "Converting VFJ to DesignSpace+UFO with FontLab 7..."
"/Applications/FontLab 7.app/Contents/MacOS/FontLab 7" "./01_export_fontlab_lato.vfpy"
echo "TODO: Converting DesignSpace+UFO to final fonts with fontmake..."
python3 "./03_build_lato_fontmake.py"
