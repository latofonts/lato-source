#!/usr/bin/env bash
dir=${0%/*}; if [ "$dir" = "$0" ]; then dir="."; fi; cd "$dir";

# fontTools
# pip3 install --user --upgrade git+https://github.com/fonttools/fonttools@feaLib-STAT
# fontmake
# pip3 install --user --upgrade git+https://github.com/googlefonts/fontmake

for BASEFONT in "Lato3Upr" "Lato3Ita"; do
    echo "Building ${BASEFONT} 2-master TTF VF...";
    OUTDIR="../build/${BASEFONT}2M/vf-2master/";
    mkdir -p "${OUTDIR}";
    python3 -m fontmake \
        --mm-designspace="../sources/${BASEFONT}2M.designspace" \
        --output-dir="${OUTDIR}" \
        --output=variable \
        --keep-overlaps \
        --production-names
    echo "Building ${BASEFONT} 3-master TTF VF...";
    OUTDIR="../build/${BASEFONT}2M/vf-3master/";
    mkdir -p "${OUTDIR}";
    python3 -m fontmake \
        --mm-designspace="../sources/${BASEFONT}3M.designspace" \
        --output-dir="${OUTDIR}" \
        --output=variable \
        --keep-overlaps \
        --production-names
    echo "Building ${BASEFONT} static TTFs...";
    OUTDIR="../build/${BASEFONT}2M/static-ttf/";
    mkdir -p "${OUTDIR}";
    python3 -m fontmake \
        --mm-designspace="../sources/${BASEFONT}2M.designspace" \
        --output-dir="${OUTDIR}" \
        --output=ttf-interpolatable \
        --autohint \
        --production-names
    echo "Building ${BASEFONT} static OTFs...";
    OUTDIR="../build/${BASEFONT}2M/static-otf/";
    mkdir -p "${OUTDIR}";
    python3 -m fontmake \
        --mm-designspace="../sources/${BASEFONT}2M.designspace" \
        --output-dir="${OUTDIR}" \
        --output=otf-interpolatable \
        --autohint \
        --optimize-cff=2 \
        --production-names
done;

echo "Done.";
