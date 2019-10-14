#!/usr/bin/env bash
dir=${0%/*}; if [ "$dir" = "$0" ]; then dir="."; fi; cd "$dir";
[ -z $(which "statmake") ] && pip3 install --user --upgrade statmake;
[ -z $(which "fontmake") ] && pip3 install --user --upgrade fontmake;
[ -z $(which "yaml22plist") ] && pip3 install --user --upgrade yaplon;

python3 $(which yaml22plist) -i Lato3.stylespace.yaml -o Lato3.stylespace

vardir="../../../fonts/variable"

mkdir -p "$vardir"
cp ../Variable-TT/Lato3Upr3M-VF.ttf "$vardir/LatoVF.ttf"
sfntedit -d STAT "$vardir/LatoVF.ttf"
statmake --designspace Lato3Upr3M.designspace --stylespace Lato3.stylespace "$vardir/LatoVF.ttf"

cp ../Variable-TT/Lato3Ita3M-VF.ttf "$vardir/LatoVF-Italic.ttf"
sfntedit -d STAT "$vardir/LatoVF-Italic.ttf"
statmake --designspace Lato3Ita3M.designspace --stylespace Lato3.stylespace "$vardir/LatoVF-Italic.ttf"

echo "OK"