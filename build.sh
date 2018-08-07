#!/bin/bash
shopt -s globstar
rm -rf build
for f in ./site/**; do
    dest=${f/site/build}
    echo "$f" '==>' "$dest"
    if [ -d "$f" ]; then
        mkdir "$dest"
    elif [ -f "$f" ]; then
        if [[ $f == *.html ]]; then
            cat 'site-includes/header.html' "$f" > "$dest"
        else
            cat "$f" > "$dest"
        fi
    fi
done
