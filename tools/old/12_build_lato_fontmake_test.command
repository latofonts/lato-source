#!/usr/bin/env bash
dir=${0%/*}; if [ "$dir" = "$0" ]; then dir="."; fi; cd "$dir";

# fontTools
# pip3 install --user --upgrade git+https://github.com/fonttools/fonttools@feaLib-STAT
# fontmake
# pip3 install --user --upgrade git+https://github.com/googlefonts/fontmake

for BASEFONT in "Lato3Upr" "Lato3Ita"; do
    echo "Building ${BASEFONT} 3-master TTF VF...";
    OUTDIR="../build/${BASEFONT}2M/vf-3master/";
    mkdir -p "${OUTDIR}";
    python3 -m fontmake \
        --mm-designspace="../sources/${BASEFONT}3M.designspace" \
        --output-dir="${OUTDIR}" \
        --output=variable \
        --keep-overlaps \
        --production-names \
        --verbose='DEBUG'
done;

echo "Done.";
