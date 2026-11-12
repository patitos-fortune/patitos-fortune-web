#!/bin/sh
# Publication guard: fails if any HTML file still contains an unresolved publication placeholder.
# Usage: sh scripts/check-publication-placeholders.sh [directory]   (default: current directory)
# Markers detected: "[[" and "PUBLICATION BLOCKER". Exit status 1 = unresolved placeholders found.
dir="${1:-.}"
hits=$(grep -rnF --include='*.html' --exclude-dir=.git -e '[[' -e 'PUBLICATION BLOCKER' "$dir")
if [ -n "$hits" ]; then
    echo "Unresolved publication placeholders found:"
    echo "$hits"
    exit 1
fi
echo "OK: no unresolved publication placeholders."
exit 0
