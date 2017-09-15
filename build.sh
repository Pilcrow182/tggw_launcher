#!/bin/bash
ScriptDir="$(cd "$(dirname "$0")" && pwd)"
TempDir=$(mktemp -d "/tmp/build.XXXXXXXXXX")

printf '[Desktop Entry]\nType=Application\nExec=run\nName=run\nIcon=run\n' > "$ScriptDir/filesystem/run.desktop"
chmod a+x "$ScriptDir/filesystem/run.desktop"
convert xc:white -size 1x1 "$ScriptDir/filesystem/run.png"

wget -c "https://github.com/probonopd/AppImageKit/releases/download/continuous/AppRun-x86_64" -O "$ScriptDir/filesystem/AppRun"
chmod a+x "$ScriptDir/filesystem/AppRun"

wget -c "https://github.com/probonopd/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" -O "$TempDir/appimagetool"
chmod a+x "$TempDir/appimagetool"

rm -rf "$ScriptDir/launcher"
"$TempDir/appimagetool" "$ScriptDir/filesystem" "$TempDir/launcher"
mv "$TempDir/launcher" "$ScriptDir/launcher"

rm -rf "$ScriptDir/filesystem/appimagetool" "$ScriptDir/filesystem/AppRun" "$ScriptDir/filesystem/run.desktop" "$ScriptDir/filesystem/run.png" "$ScriptDir/filesystem/.DirIcon" "$TempDir"
